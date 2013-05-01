require "patches"
Message = require "messenger/messages/message"

#
# @author - Tim Shelburne <tim@musiconelive.com>
#
# a message dismissed from a time limit
#
class TimeDismissedMessage extends Message

  TimeDismissedMessage.property 'type',
    get: -> "time"

  TimeDismissedMessage.property 'htmlId',
    get: -> "text-message"

  constructor: (@message, @timeToDisplay)->
    super(@message)

  init: ->
    setTimeout( =>
      @dismiss.dispatch(@)
    , @timeToDisplay)

return TimeDismissedMessage