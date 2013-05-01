Message = require "messenger/messages/message"
Message::buildMarkupObj = (message)-> @markupObj = $("<article id='MESSAGE-ID'><p>#{message}</p></article>")

describe "Message", ->
  message = null

  beforeEach ->
    message = new Message("Message.")

  it "can return the html content of a message", ->
    expect(message.getHtml()).toEqual "<article id=\"MESSAGE-ID\"><p>Message.</p></article>"