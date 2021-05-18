

// app/javascript/channels/chat_channel.js
import consumer from "./consumer"

consumer.subscriptions.create({ channel: "RoomChannel"}, {
  received(data) {
    debugger
    if(data["room_id"] == $("#chat").attr("data-room-id") ){
      this.appendLine(data);
    }
    
    $("#new_room_message").find('input[type="text"]').val('');
  },
 
  appendLine(data) {
    const html = this.createLine(data)
    const element = document.getElementById("chat")
    element.insertAdjacentHTML("beforeend", html)
  },
 
  createLine(data) {
    debugger;
    var style = data["user_id"] == $("#user").attr('user-id') ? 'me' : 'you';
    return `

      <li class="chat-message-container ${style}">
              <p style="width: fit-content;max-width: 70%;" >
                ${data["message"]}
              </p>
      </li>
    `
  }
});


          // <figure>
          //   <img src="https://gravatar.com/avatar/c05687042c7771d480f3fb0d33ca8759.png" class="avatar" alt="">
          // </figure>