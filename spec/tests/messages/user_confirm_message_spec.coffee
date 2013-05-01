UserConfirmMessage = require "messenger/messages/user_confirm_message"

describe "UserConfirmMessage", ->
  message = null

  beforeEach ->
    message = new UserConfirmMessage("Confirm message.", "OK")
    spyOn(message.dismiss, "dispatch")

  it "can dismiss upon the confirm button being clicked", ->
    message.init()
    message.confirmClicked()
    expect(message.dismiss.dispatch).toHaveBeenCalledWith message