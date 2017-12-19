class RoomChannel < ApplicationCable::Channel
  def subscribed
    group = params[:group]
    stream_from "room_channel_#{group}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
