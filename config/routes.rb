# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'home#index', as: :home

  # API endpoints here
  namespace :api do
    namespace :v1 do
      get '/oauth2/authorize', to: 'openid_connect#authorize'
      post '/oauth2/token', to: 'openid_connect#token'
      get '/oauth2/userInfo', to: 'openid_connect#user_info'
      post '/organisation-search', to: 'organisation#search'
      post '/user/confirm', to: 'user#confirm_user'
      post '/user/create', to: 'user#create_user'
      post '/user/delete', to: 'user#delete_user'
      post '/user/update/password', to: 'user#update_password_user'
    end
    namespace :v2 do
      get '/oauth2/authorize', to: 'auth_authorize#authorize'
    end
  end

  namespace 'base', path: 'auth' do
    get '/sign-up', to: 'registrations#new', as: :new_user_registration
    post '/sign-up', to: 'registrations#create', as: :user_registration
    get '/domain-not-on-whitelist', to: 'registrations#domain_not_on_whitelist', as: :domain_not_on_whitelist
    get '/users/confirm', to: 'users#confirm_new', as: :users_confirm_path
    post '/users/confirm', to: 'users#confirm'
    get '/resend_confirmation_email', to: 'users#resend_confirmation_email', as: :resend_confirmation_email
    get '/sign-in', to: 'sessions#new', as: :new_user_session
    post '/sign-in', to: 'sessions#create', as: :user_session
    delete '/sign-out', to: 'sessions#destroy', as: :destroy_user_session
    get '/users/forgot-password', to: 'passwords#new', as: :new_user_password
    post '/users/password', to: 'passwords#create'
    get '/users/forgot-password-confirmation', to: 'passwords#confirm_new', as: :confirm_new_user_password
    get '/users/password', to: 'passwords#edit', as: :edit_user_password
    put '/users/password', to: 'passwords#update'
    get '/users/password-reset-success', to: 'passwords#password_reset_success', as: :password_reset_success
    get '/users/challenge', to: 'users#challenge_new'
    post '/users/challenge', to: 'users#challenge'
  end
end
