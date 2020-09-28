# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def authenticate_user!
    if user_signed_in?
      # super
      # puts @auth_response.authentication_result
      # resp = client.get_user({
      #   access_token: @auth_response.authentication_result.access_token # required
      # })
      super
      # redirect_pmp
    else
      redirect_to base_new_user_password_path
    end
  end
end
