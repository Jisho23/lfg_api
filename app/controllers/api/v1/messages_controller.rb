class Api::V1::MessagesController < ApplicationController

  def index
  end

  def create
    message = Message.create(message_params)
    group = message.group_id
    ActionCable.server.broadcast "room_channel_#{group}",
                                  content:  message.message,
                                  username: message.user.username,
                                  image: message.user.image
  end

  def message_params
    params.permit(:message, :user_id, :group_id)
  end
end
