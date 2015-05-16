import {Socket} from "phoenix"

let userInput         = $("#username-input")
let chatInput         = $("#chat-input")
let messagesContainer = $("#messages")

let socket = new Socket("/ws")
socket.connect()
socket.join("rooms:lobby", {}).receive("ok", chan => {
  console.log("Welcome to Phoenix Chat!")

  chatInput.off("keypress").on("keypress", event => {
    if(event.keyCode === 13){
      chan.push("new_msg", {user: userInput.val(), body: chatInput.val()})
      chatInput.val("")
    }
  })

  chan.on("new_msg", payload => {
    console.log(payload);
    messagesContainer.append(`<br/>[${payload.user}] ${payload.body}`)
  })
})
