require 'rollbar'

IDAM_SSM_SERVICE_NAME_REGEX = /pmp-idam-[a-z-]+-ssm-service/.freeze

def config_aws_ssm
  ssm_client = setup_ssm_client

  pmp_idam_variables = find_pmp_idam_variables(ssm_client)

  pmp_idam_variables.each do |pmp_idam_key, pmp_idam_value|
    ENV[pmp_idam_key] = pmp_idam_value
  end

  Rails.logger.info('SUCCESS: All variables imported from AWS SSM')
rescue Aws::SSM::Errors::StandardError => e
  Rails.logger.error('ERROR: Failed to import variables from AWS SSM')
  Rails.logger.error(e.message)
end

def setup_ssm_client
  vcap_services = JSON.parse(ENV.fetch('VCAP_SERVICES', nil), symbolize_names: true)

  aws_credentials = vcap_services[:'user-provided'].find { |service| service[:name].match(IDAM_SSM_SERVICE_NAME_REGEX) }[:credentials]

  Aws::SSM::Client.new(
    region: aws_credentials[:region],
    access_key_id: aws_credentials[:aws_access_key_id],
    secret_access_key: aws_credentials[:aws_secret_access_key]
  )
end

def find_pmp_idam_variables(ssm_client)
  pmp_idam_variables = []

  next_token = nil

  loop do
    resp = ssm_client.get_parameters_by_path(
      {
        path: '/pmp-idam/',
        with_decryption: true,
        max_results: 10,
        next_token: next_token
      }
    )

    pmp_idam_variables += resp.parameters.map do |parameter|
      [
        parameter.name.split('/').last.upcase.to_s,
        parameter.value.to_s
      ]
    end

    next_token = resp.next_token

    break unless next_token
  end

  pmp_idam_variables
end

config_aws_ssm if ENV['SERVER_ENV_NAME'].present?
