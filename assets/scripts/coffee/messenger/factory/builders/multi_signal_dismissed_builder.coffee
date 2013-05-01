MultiSignalDismissedMessage = require "messenger/messages/multi_signal_dismissed_message"

#
# @author - Tim Shelburne <tim@musiconelive.com>
#
# a class to build multisignal dismissed message
#
class MultiSignalDismissedBuilder

  canHandle: (type)->
    type == "multisignal"

  handle: (message, options)->
    minTimeToDismiss = options.minTimeToDismiss ? 0
    new MultiSignalDismissedMessage(message, options.signals, minTimeToDismiss)

return MultiSignalDismissedBuilder