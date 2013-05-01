Signal = require "cronus/signal"
MessageQueue = require "messenger/message_queue"
MessageFactory = require "messenger/factory/message_factory"

#
# @author - Tim Shelburne <tim@musiconelive.com>
#
# a class to manage queueing and displaying system messages
#
class SystemMessageManager
  constructor: (@messageQueue, @messageFactory)->
    @displayView = new Signal()
    @clearView = new Signal()

    @messageQueue.display.add(@displayMessage)
    @messageQueue.dismissed.add(@messageDismissed)
    @messageQueue.finished.add(@queueFinished)

  @default: (builders=[])->
    new @(new MessageQueue(), MessageFactory.default(builders))

  queueMessage: (type, message, options)->
    @messageQueue.add(@messageFactory.build(type, message, options))

  queueMessageAt: (type, message, options, index)->
    @messageQueue.addAt(@messageFactory.build(type, message, options), index)

  removeMessage: (message)->
    @messageQueue.remove(message)

  displayMessage: (message)=>
    @displayView.dispatch(message.getHtml())
    message.init()

  messageDismissed: (message)=>
    @clearView.dispatch()

  queueFinished: =>
    @clearView.dispatch()

return SystemMessageManager