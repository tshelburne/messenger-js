TimeDismissedBuilder = require "messenger/factory/builders/time_dismissed_builder"
SignalDismissedBuilder = require "messenger/factory/builders/signal_dismissed_builder"
MultiSignalDismissedBuilder = require "messenger/factory/builders/multi_signal_dismissed_builder"
UserConfirmBuilder = require "messenger/factory/builders/user_confirm_builder"
UserDialogueBuilder = require "messenger/factory/builders/user_dialogue_builder"

#
# @author - Tim Shelburne <tim@musiconelive.com>
#
# a class to build messages
#
class MessageFactory
  constructor: (@builders)->
  
  @default: (builders=[])->
    new @([
        new TimeDismissedBuilder()
        new SignalDismissedBuilder()
        new MultiSignalDismissedBuilder()
        new UserConfirmBuilder()
        new UserDialogueBuilder()
      ].concat(builders)
    )

  build: (type, message, options)->
    for builder in @builders
      return builder.handle(message, options) if builder.canHandle(type)
    return null

return MessageFactory