# A consumer becomes a subscriber by creating a subscription to a given channel
App.chat = App.cable.subscriptions.create 'ChatChannel',
  # When we broadcast to the channel, all the clients connected to the
  # channel will receive the data and call the App.chat.received function
  received: (data) ->
    $('#messages').append("<p>#{data['message']}</p>")

  speak: (message) ->
    @perform('speak', message: message)

# When you hit enter, this pushes the content of the field to the cable server
$(document).on('keypress', '#speaker', (event) ->
  if event.keyCode is 13
    App.chat.speak(event.target.value)
    event.target.value = ''
    event.preventDefault()
)
