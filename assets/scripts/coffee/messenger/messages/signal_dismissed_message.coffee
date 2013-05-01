require "patches"
Message = require "messenger/messages/message"

#
# @author - Tim Shelburne <tim@musiconelive.com>
#
# a message dismissed from a signal
#
class SignalDismissedMessage extends Message

  SignalDismissedMessage.property 'type',
    get: -> "signal"

  SignalDismissedMessage.property 'htmlId',
    get: -> "text-message"

  constructor: (@message, @signal, @minTimeToShow)->
    super(@message)
    @timerFinished = false
    @signalFinished = false

  init: ->
    @signal.addOnce(@signalReceived)
    setTimeout( =>
      @timerFinished = true
      @dismiss.dispatch(@) if @signalFinished
    , @minTimeToShow)

  signalReceived: =>
    @signalFinished = true
    @dismiss.dispatch(@) if @timerFinished

return SignalDismissedMessage