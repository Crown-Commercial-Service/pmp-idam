# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def accessibility_statement; end

  def cookie_settings; end

  def cookie_policy; end

  def update_cookie_settings
    if params[:ga_cookie_usage] == 'true'
      cookies[:pmp_google_analytics_enabled] = {
        value: 'true',
        expires: 1.year.from_now
      }
    else
      cookies.delete(:pmp_google_analytics_enabled)

      cookies.each do |cookie_name, _|
        cookies.delete(cookie_name, path: '/', domain: '.crowncommercial.gov.uk') if COOKIE_PREFIXES.any? { |cookie_prefix| cookie_name.start_with? cookie_prefix }
      end
    end

    params[:cookies_updated] = true

    render :cookie_settings
  end

  COOKIE_PREFIXES = %w[_ga _gi _cls].freeze
end
