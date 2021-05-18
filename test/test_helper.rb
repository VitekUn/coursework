# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    fixtures :all

    # Returns true if the test user logged in.
    def logged_in?
      !session[:user_id].nil?
    end

    # Logs in the test user
    def log_in_as(user, options = {})
      password    = options[:password]    || 'password'
      remember_me = options[:remember_me] || '1'
      if integration_test?
        post login_path, params: { session: { email: user.email,
                                              password: password,
                                              remember_me: remember_me } }
      else
        session[:user_id] = user.id
      end
    end

    # Returns true inside integration tests
    def integration_test?
      defined?(post login_path)
    end
  end
end
