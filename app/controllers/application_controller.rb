class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, if: -> { protect_forgery? }

  def raise_not_found
    respond_to do |format|
      format.html do
        render json: {status: 'NG', errors: "url not found" }, status: 404
      end
      format.json do
        render json: {status: 'NG', errors: "url not found" }, status: 404
      end
    end
  end

  private

  def protect_forgery?
    params[:action] != 'raise_not_found'
  end
end
