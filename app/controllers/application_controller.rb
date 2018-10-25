class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, if: -> { protect_forgery? }

  private

  def protect_forgery?
    true
  end
end
