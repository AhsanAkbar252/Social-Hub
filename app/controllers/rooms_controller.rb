class RoomsController < ApplicationController
  before_action :load_entities 

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new permitted_parameters
    connectins = connected_users(@room.first_person)
    if ! (@room.second_person.in? connectins) && (@room.second_person != @room.first_person)
      if @room.save
        flash[:success] = "Room was created successfully"
        redirect_to rooms_path
      else
        render :new
      end
    else
      flash[:danger] = "Room is already present"
      redirect_to rooms_path
    end
  end

  def show
    @room_message = RoomMessage.new room: @room
    @room_messages = @room.room_messages.includes(:user)
    @users = User.where.not(id: current_user.id)
    @user = @users.where(id: @room.first_person_id).or(@users.where(id: @room.second_person_id))
  end

  def edit
  end

  def  connected_users(user)
    connections = Array.new
    user.rooms.each do|room|
      if room.first_person != current_user
        connections.push(room.first_person)
      elsif room.second_person != current_user
        connections.push(room.second_person)
      end
    end
    return connections
  end

  def update
    if @room.update_attributes(permitted_parameters)
      flash[:success] = "Room #{@room.name} was updated successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  protected

  def load_entities
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:room).permit(:first_person_id,:second_person_id)
  end
end
