# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user! # Authenticate user on sign in w/ devise
  protect_from_forgery with: :exception
end
