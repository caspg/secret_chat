$(document).ready(function() {
  function readRoomSecretId() {
    return $('.chat-box')[0].dataset.roomSecretId
  }

  const subscriptionParams = {
    channel: "RoomChannel",
    roomSecretId: readRoomSecretId(),
  }

  console.log('subscriptionParams: ', subscriptionParams)

  App.room = App.cable.subscriptions.create(subscriptionParams, {
    connected: function() {
      // Called when the subscription is ready for use on the server
    },
    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },
    received: function(data) {
      const roomMessages = $('.room-messages')

      roomMessages.append(data.message)
      roomMessages.scrollTop(roomMessages[0].scrollHeight)
      // Called when there's incoming data on the websocket for this channel
    }
  })
})
