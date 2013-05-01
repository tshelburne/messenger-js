UserConfirmMessage = require "messenger/messages/user_confirm_message"

#
# @author - Tim Shelburne <tim@musiconelive.com>
#
# a class to build user confirm message
#
class UserConfirmBuilder

  canHandle: (type)->
    type == "confirm"

  handle: (message, options)->
    new UserConfirmMessage(message, options.confirmLabel)

return UserConfirmBuilder