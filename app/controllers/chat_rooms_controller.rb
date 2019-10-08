class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = ChatRoom.new permitted_params

    if @chat_room.save
      flash[:success] = "ChatRoom #{@chat_room.topic} was created successfully"
      redirect_to chat_rooms_path
    else
      render :new
    end
  end

  protected

  def permitted_params
    params.require(:chat_room).permit(:topic)
  end
end
