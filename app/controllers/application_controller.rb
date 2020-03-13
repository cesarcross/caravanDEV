# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :detect_device_format

  private

  def detect_device_format
    case request.user_agent
    when /iPad/i
      request.variant = :mobile
    when /iPhone/i
      request.variant = :mobile
    when /Android/i && /mobile/i
      request.variant = :mobile
    when /Android/i
      request.variant = :mobile
    when /Windows Phone/i
      request.variant = :mobile
    end
  end
end
