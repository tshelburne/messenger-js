Message = require "messenger/messages/message"
Message::buildMarkupObj = (message)-> @markupObj = $("<article id='MESSAGE-ID'><p>#{message}</p></article>")

UserDialogueMessage = require "messenger/messages/user_dialogue_message"

describe "UserDialogueMessage", ->
  message = null

  beforeEach ->
    message = new UserDialogueMessage("Confirm message.", "OK", "Cancel")
    spyOn(message.dismiss, "dispatch")

  it "can dismiss upon the confirm button being clicked", ->
    message.init()
    message.confirmClicked()
    expect(message.dismiss.dispatch).toHaveBeenCalledWith(message, true)

  it "can dismiss upon the deny button being clicked", ->
    message.init()
    message.denyClicked()
    expect(message.dismiss.dispatch).toHaveBeenCalledWith(message, false)