MessageFactory = require "messenger/factory/message_factory"

describe "MessageFactory", ->
  beforeEach ->
    factory = null

  it "can build a message", ->
    factory = MessageFactory.default()
    message = factory.build("time", "A timed message.", { timeToDisplay : 500 })
    expect(message?).toBeTruthy()
    expect(message.message).toEqual "A timed message."

  it "can take a collection of additional message builders.", ->
    factory = MessageFactory.default([ mocks.messageBuilder ])
    expect(factory.builders.indexOf( mocks.messageBuilder )).not.toEqual -1
    expect(factory.build("mock", "mock1", {})).toEqual mocks.message1