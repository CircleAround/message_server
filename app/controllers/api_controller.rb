class ApiController < ApplicationController
  class UnauthorizedError; end

  rescue_from ActionController::ParameterMissing,
              ActiveModel::UnknownAttributeError,
              with: :rescue400
  rescue_from ActiveRecord::RecordInvalid,
              with: :rescue422
  rescue_from ActiveRecord::RecordNotFound,
              with: :rescue404
  rescue_from UnauthorizedError,
              with: :rescue401

  private

  def rescue422(e)
    render_fail e.record.errors.full_messages, :unprocessable_entity
  end

  def rescue404(e)
    render_fail e, 404
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
