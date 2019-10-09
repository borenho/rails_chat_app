class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    load_entities
    @message = Message.new chat_room: @chat_room
    @messages = @chat_room.messages.includes(:user)
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

  def edit

  end

  def update
    load_entities
    if @chat_room.update_attributes(permitted_params)
      flash[:success] = "ChatRoom #{@chat_room.topic} was successfully updated"
      redirect_to chat_rooms_path
    else
      render :new
    end
  end

  protected

  def permitted_params
    params.require(:chat_room).permit(:topic)
  end

  def load_entities
    @chat_rooms =  ChatRoom.all
    @chat_room = ChatRoom.find(params[:id]) if params[:id]
  end
end
