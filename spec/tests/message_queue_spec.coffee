MessageQueue = require "messenger/message_queue"
Message = require "messenger/messages/message"

describe "MessageQueue", ->
  queue = null

  beforeEach ->
    queue = new MessageQueue()

  it "can add messages to the queue", ->
    queue.add(mocks.message1)
    expect(queue.messages.length).toEqual 1

  it "can add messages to the queue at a specified position", ->
    queue.add(mocks.message1)
    queue.addAt(mocks.message2, 0)
    queue.addAt(mocks.message2, 1)
    queue.addAt(mocks.message1, 1)
    expect(queue.messages[0]).toEqual mocks.message2
    expect(queue.messages[1]).toEqual mocks.message1

  it "can remove messages from the queue", ->
    queue.add(mocks.message1)
    queue.add(mocks.message2)
    queue.remove(mocks.message1)
    expect(queue.messages.length).toEqual 1

  describe "when interacting with a Message", ->
    message = null

    beforeEach ->
      message = new Message()

    it "can dispatch signals for messages upon being queued", ->
      spyOn(queue.queued, "dispatch")
      queue.add(message)
      expect(queue.queued.dispatch).toHaveBeenCalledWith(message)

    it "can dispatch signals for messages to be displayed", ->
      spyOn(queue.display, "dispatch")
      queue.add(message)
      expect(queue.display.dispatch).toHaveBeenCalledWith(message)

    it "can dispatch signals for messages upon being dismissed", ->
      spyOn(queue.dismissed, "dispatch")
      queue.add(message)
      message.dismiss.dispatch()
      expect(queue.dismissed.dispatch).toHaveBeenCalledWith(message)

    it "can remove a message once it is dismissed", ->
      queue.add(message)
      message.dismiss.dispatch()
      expect(queue.messages.length).toEqual 0

    it "can dispatch signals for messages upon being removed", ->
      spyOn(queue.removed, "dispatch")
      queue.add(message)
      message.dismiss.dispatch()
      expect(queue.removed.dispatch).toHaveBeenCalledWith(message)

    it "can dispatch signals that the queue has finished", ->
      spyOn(queue.finished, "dispatch")
      queue.add(message)
      message.dismiss.dispatch()
      expect(queue.finished.dispatch).toHaveBeenCalled()