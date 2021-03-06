# frozen_string_literal: true

module Base
  class UsersController < ApplicationController
    before_action :authenticate_user!, except: %i[confirm_new confirm challenge_new challenge resend_confirmation_email]
    before_action :authorize_user, except: %i[confirm_new confirm challenge_new challenge resend_confirmation_email]
    before_action :set_user_phone, only: %i[challenge_new challenge], if: -> { params[:challenge_name] == 'SMS_MFA' }

    def confirm_new
      @result = Cognito::ConfirmSignUp.new(nil, nil)
    end

    def confirm
      @result = Cognito::ConfirmSignUp.call(params[:email], params[:confirmation_code])
      if @result.success?
        Rails.logger.info 'ACCOUNT ACTIVATION SUCCESSFUL'
        sign_in_user(@result.user)
      else
        Rails.logger.info "ACCOUNT ACTIVATION FAILED: #{get_error_list(@result.errors)}"
        render :confirm_new
      end
    end

    def challenge_new
      @challenge = Cognito::RespondToChallenge.new(params[:challenge_name], params[:username], params[:session])
    end

    def challenge
      @challenge = Cognito::RespondToChallenge.new(params[:challenge_name], params[:username], params[:session], new_password: params[:new_password], new_password_confirmation: params[:new_password_confirmation], access_code: params[:access_code])
      @challenge.call
      if @challenge.success?
        @challenge.challenge? ? redirect_to(new_challenge_path) : find_and_sign_in_user
      else
        render :challenge_new
      end
    end

    def resend_confirmation_email
      result = Cognito::ResendConfirmationCode.call(params[:email])
      Rails.logger.info 'ACCOUNT ACTIVATION EMAIL RESENT'

      redirect_to base_users_confirm_path_path(email: params[:email]), error: result.error
    end

    private

    def new_challenge_path
      users_challenge_path(challenge_name: @challenge.new_challenge_name, session: @challenge.new_session, username: params[:username])
    end

    def find_and_sign_in_user
      user = Cognito::CreateUserFromCognito.call(params[:username]).user
      sign_in_user(user)
    end

    def sign_in_user(_user)
      # sign_in(user)
      # redirect_to after_sign_in_path_for(user)
      redirect_to base_new_user_session_path
    end

    def set_user_phone
      user_phone_full = User.find_by(cognito_uuid: params[:username]).try(:phone_number) || Cognito::CreateUserFromCognito.call(params[:username]).try(:user).try(:phone_number)
      @user_phone = '*' * 9 + user_phone_full[(user_phone_full.length - 3)..user_phone_full.length] if user_phone_full
    end
  end
end
