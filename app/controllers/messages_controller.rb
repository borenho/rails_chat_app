class MessagesController < ApplicationController
  def create
    set_chat_room
    @message = Message.create user: current_user,
                              chat_room: @chat_room,
                              content: params.dig(:message, :content)
  end

  protected

  def set_chat_room
    @chat_room = ChatRoom.find(params.dig(:message, :chat_room_id))
  end
end
