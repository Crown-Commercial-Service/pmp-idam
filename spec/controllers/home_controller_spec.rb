require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET accessibility_statement' do
    it 'renders the accessibility_statement page' do
      get :accessibility_statement

      expect(response).to render_template(:accessibility_statement)
    end
  end

  describe 'GET cookie_policy' do
    it 'renders the cookie policy page' do
      get :cookie_policy

      expect(response).to render_template(:cookie_policy)
    end
  end

  describe 'GET cookie_settings' do
    it 'renders the cookie settings page' do
      get :cookie_settings

      expect(response).to render_template(:cookie_settings)
    end
  end

  describe 'PUT update_cookie_settings' do
    context 'when enableing the cookies' do
      before do
        %i[_ga_cookie _gi_cookie _cls_cookie].each do |cookie_name|
          cookies[cookie_name] = { value: 'test_cookie', domain: '.crowncommercial.gov.uk', path: '/' }
        end

        put :update_cookie_settings, params: { ga_cookie_usage: 'true' }
      end

      it 'sets the cookie' do
        expect(cookies[:pmp_google_analytics_enabled]).to eq('true')

        %i[_ga_cookie _gi_cookie _cls_cookie].each do |cookie_name|
          expect(cookies[cookie_name]).to eq 'test_cookie'
        end
      end

      it 'updates the cookies_updated param' do
        expect(controller.params[:cookies_updated]).to be true
      end

      it 'renders the cookie_settings template' do
        expect(response).to render_template(:cookie_settings)
      end
    end

    context 'when disabling the cookies' do
      before do
        cookies[:pmp_google_analytics_enabled] = { value: 'true' }

        %i[_ga_cookie _gi_cookie _cls_cookie].each do |cookie_name|
          cookies[cookie_name] = { value: 'test_cookie', domain: '.crowncommercial.gov.uk', path: '/' }
        end

        put :update_cookie_settings, params: { ga_cookie_usage: 'false' }
      end

      it 'deletes the cookie' do
        %w[_ga_cookie _gi_cookie _cls_cookie pmp_google_analytics_enabled].each do |cookie_name|
          expect(response.cookies[cookie_name]).to be_nil
        end
      end

      it 'updates the cookies_updated param' do
        expect(controller.params[:cookies_updated]).to be true
      end

      it 'renders the cookie_settings template' do
        expect(response).to render_template(:cookie_settings)
      end
    end
  end
end
