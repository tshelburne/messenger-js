SystemMessageManager = require "messenger/system_message_manager"
MessageQueue = require "messenger/message_queue"
MessageFactory = require "messenger/factory/message_factory"

describe "SystemMessageManager", ->
  manager = null

  beforeEach ->
    manager = SystemMessageManager.default([ mocks.messageBuilder ])

  describe "when using MessageQueue", ->

    it "can queue a message", ->
      manager.queueMessage("mock", "mock1", {})
      expect(manager.messageQueue.messages.length).toEqual 1

    it "can queue a message at an index", ->
      manager.queueMessage("mock", "mock1", {})
      manager.queueMessageAt("mock", "mock2", {}, 0)
      expect(manager.messageQueue.messages[0]).toEqual mocks.message2

    it "can remove a message from the queue", ->
      manager.queueMessage("mock", "mock1", {})
      manager.removeMessage(manager.messageQueue.messages[0])
      expect(manager.messageQueue.messages.length).toEqual 0

    it "can respond to the queue finishing", ->
      spyOn(manager.clearView, "dispatch")
      manager.queueMessage("time", "A time message.", { timeToDisplay : 500 })
      manager.messageQueue.currentMessage.dismiss.dispatch()
      expect(manager.clearView.dispatch).toHaveBeenCalled()

    it "can display a message", ->
      spyOn(manager.displayView, "dispatch")
      manager.queueMessage("mock", "mock1", { timeToDisplay : 500 })
      expect(manager.displayView.dispatch).toHaveBeenCalled()

#restore Message::buildMarkupObj