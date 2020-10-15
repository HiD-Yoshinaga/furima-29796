class MessagesController < ApplicationController
  def new
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    # binding.pry
    if @message.save
      ActionCable.server.broadcast 'message_channel', {content: @message, nickname: current_user.nickname, time: @message.created_at.strftime("%Y/%m/%d %H:%M:%S")}
    end
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
