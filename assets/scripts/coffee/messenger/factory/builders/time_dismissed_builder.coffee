TimeDismissedMessage = require "messenger/messages/time_dismissed_message"

#
# @author - Tim Shelburne <tim@musiconelive.com>
#
# a class to build time dismissed message
#
class TimeDismissedBuilder

  canHandle: (type)->
    type == "time"

  handle: (message, options)->
    new TimeDismissedMessage(message, options.timeToDisplay)

return TimeDismissedBuilder