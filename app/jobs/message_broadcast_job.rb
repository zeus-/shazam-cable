class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # A broadcasting is a pub/sub link where anything transmitted by a publisher
    # is routed directly to the channel subscribers who are streaming
    ActionCable.server.broadcast('room_channel', message: show_message(message))
  end

  private

  def show_message(message)
    ApplicationController.render(partial: 'messages/message',locals: { message: message })
  end
end
