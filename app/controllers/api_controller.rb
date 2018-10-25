class ApiController < ApplicationController
  before_action :check_authenticated, if: :enable_authenticated?

  class UnauthorizedError < StandardError; end

  rescue_from ActionController::ParameterMissing,
              ActiveModel::UnknownAttributeError,
              ActionController::UnpermittedParameters,
              with: :rescue422
  rescue_from ActiveRecord::RecordInvalid,
              with: :rescue_invalid
  rescue_from ActiveRecord::RecordNotFound,
              with: :rescue404
  rescue_from UnauthorizedError,
              with: :rescue401

  private

  def check_authenticated
    token = request.headers['Authorization']
    @current_user = User.find_by(token:  token)

    raise UnauthorizedError, "token not found" unless @current_user
  end

  def current_user
    @current_user
  end

  def enable_authenticated?
    true
  end

  def rescue401(e)
    render_fail e, 401
  end

  def rescue404(e)
    render_fail e, 404
  end

  def rescue422(e)
    render_fail e, :unprocessable_entity
  end

  def rescue_invalid(e)
    render_fail e.record.errors.full_messages, :unprocessable_entity
  end

  def render_fail(errors, status)
    respond_to do |format|
      format.html do
        # nop
      end
      format.json do
        render json: {status: 'NG', errors: errors }, status: status
      end
    end
  end

  def protect_forgery?
    false # for posting json
  end
end
