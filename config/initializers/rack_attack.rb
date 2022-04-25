Rack::Attack.throttle('requests to organisation-search api by ip ', limit: 100, period: 3600) do |request|
  request.ip if request.path == '/api/v1/organisation-search'
end
