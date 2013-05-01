require "patches"
Message = require "messenger/messages/message"

#
# @author - Tim Shelburne <tim@musiconelive.com>
#
# a message dismissed from a list of signals
#
class MultiSignalDismissedMessage extends Message

  MultiSignalDismissedMessage.property 'type',
    get: -> "multisignal"

  MultiSignalDismissedMessage.property 'htmlId',
    get: -> "text-message"

  constructor: (@message, @signals, @minTimeToShow)->
    super(@message)
    @timerFinished = false
    @signalFinished = false

  init: ->
    for signal in @signals
      signal.add(@signalReceived)

    setTimeout( =>
      @timerFinished = true
      @dismiss.dispatch(@) if @signalFinished
    , @minTimeToShow)

  signalReceived: =>
    @signalFinished = true
    signal.remove(@signalReceived) for signal in @signals
    @dismiss.dispatch(@) if @timerFinished

return MultiSignalDismissedMessage