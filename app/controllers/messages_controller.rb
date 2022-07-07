class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.all
  end

  def show
  end

  def count
    @count = Messages.count
  end

  def create
    message = Message.create(params.require(:message).permit(:message))
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.append(
          :messages,
          partial:'messages/message',
          locals: { message: message, count: Message.count }
          )
      end

      format.html { redirect_to messages_url }
    end
  end

  def destroy
    message.destroy!
  end

  def update
  end

end
