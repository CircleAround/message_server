class Api::MessagesController < ApiController
  before_action :set_message, only: [:show, :edit, :update, :destroy, :attach_image]

  # GET /api/messages
  # GET /api/messages.json
  def index
    @messages = Message.all.limit(25)
  end

  # GET /api/messages/1
  # GET /api/messages/1.json
  def show
  end

  # POST /api/messages
  # POST /api/messages.json
  def create
    @message = Message.new(message_params)
    @message.user = current_user

    respond_to do |format|
      @message.save!
      format.json { render action: 'show', status: :created, location: @message }
    end
  end

  # PATCH/PUT /api/messages/1
  # PATCH/PUT /api/messages/1.json
  def update
    respond_to do |format|
      @message.update!(message_params)
      format.json { head :no_content }
    end
  end

  # DELETE /api/messages/1
  # DELETE /api/messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def attach_image
    respond_to do |format|
      @message.update!(message_image_params)
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:contents)
    end

    def message_image_params
      params.require(:message).permit(:image)
    end
end
