class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "rooms"

    # or
    # stream_from "room_#{params[:room]}"
  end
end