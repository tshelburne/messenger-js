Signal = require "cronus/signal"

#
# @author - Tim Shelburne <tim@musiconelive.com>
#
# a class to handle moving messages through the queue
#
class MessageQueue
  constructor: ->
    @currentMessage = null
    @messages = []

    @queued = new Signal()
    @display = new Signal()
    @dismissed = new Signal()
    @removed = new Signal()
    @finished = new Signal()

  add: (message)->
    @addAt(message, @messages.length)

  addAt: (message, index)->
    @messages.splice(index, 0, message)
    @queued.dispatch(message)

    if (@messages.length is 1)
      @currentMessage = message
      @currentMessage.dismiss.add(@messageDismissed)
      @display.dispatch(@currentMessage)

  remove: (message)->
    @messages.splice(@messages.indexOf(message), 1)
    @removed.dispatch(message)

  messageDismissed: =>
    @dismissed.dispatch(@currentMessage)
    @remove(@currentMessage)

    if @messages.length > 0
      @currentMessage = @messages[0]
      @currentMessage.dismiss.add(@messageDismissed)
      @display.dispatch(@currentMessage)
    else
      @finished.dispatch()

return MessageQueue