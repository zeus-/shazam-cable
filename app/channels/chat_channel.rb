# The next thing we will do is generate a channel that we can use to communicate
# via websockets between the client and the server.

# rails generate channel Chat speak
# It also generates a chat.coffee file in app/assets/javascripts/channels.

class ChatChannel < ApplicationCable::Channel
  # When a client connects to the channel, the #subscribed action is called.
  def subscribed
    # This subscribes the client to the channel. Whenever data is broadcast
    # to the channel, it is pushed to the clients/subscribers.
    stream_from('chat_channel')
  end

  # The #speak action corresponds to a method in the client side code. When a
  # user types a message and hits enter, we can call App.chat.speak on the client
  # side, which in turn invokes this action on the server.
  def speak(data)
    ActionCable.server.broadcast('chat_channel', message: data['message'])
  end
end
