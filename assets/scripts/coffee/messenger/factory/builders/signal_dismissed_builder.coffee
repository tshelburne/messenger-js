SignalDismissedMessage = require "messenger/messages/signal_dismissed_message"

#
# @author - Tim Shelburne <tim@musiconelive.com>
#
# a class to build signal dismissed message
#
class SignalDismissedBuilder

  canHandle: (type)->
    type == "signal"

  handle: (message, options)->
    minTimeToDismiss = options.minTimeToDismiss ? 0
    new SignalDismissedMessage(message, options.signal, minTimeToDismiss)

return SignalDismissedBuilder