class Api::ImagesController < ApiController
  before_action :set_message, only: :create

  # POST /api/messages/:message_id/images
  def create
    respond_to do |format|
      @message.image.attach(message_image_params[:image])
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:message_id])
  end

  def message_image_params
    params.require(:message).permit(:image)
  end
end
