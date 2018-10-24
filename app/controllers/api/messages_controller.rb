class Api::MessagesController < ApiController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /api/messages
  # GET /api/messages.json
  def index
    @messages = Message.all
  end

  # GET /api/messages/1
  # GET /api/messages/1.json
  def show
  end

  # GET /api/messages/new
  def new
    @message = Message.new
  end

  # GET /api/messages/1/edit
  def edit
  end

  # POST /api/messages
  # POST /api/messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to [:api, @message], notice: 'Message was successfully created.' }
        format.json { render action: 'show', status: :created, location: @message }
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/messages/1
  # PATCH/PUT /api/messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to [:api, @message], notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/messages/1
  # DELETE /api/messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to api_messages_url, notice: 'Message was successfully destroyed.' }
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
      params.require(:message).permit(:contents, :user_id)
    end
end
