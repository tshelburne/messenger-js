UserDialogueMessage = require "messenger/messages/user_dialogue_message"

#
# @author - Tim Shelburne <tim@musiconelive.com>
#
# a class to build user dialogue message
#
class UserDialogueBuilder

  canHandle: (type)->
    type == "dialogue"

  handle: (message, options)->
    new UserDialogueMessage(message, options.confirmLabel, options.denyLabel)

return UserDialogueBuilder