require "patches"
require "lib/jquery"
UserConfirmMessage = require "messenger/messages/user_confirm_message"

#
# @author - Tim Shelburne <tim@musiconelive.com>
#
# a message dismissed from a user
#
class UserDialogueMessage extends UserConfirmMessage

  UserDialogueMessage.property 'type',
    get: -> "dialogue"

  UserDialogueMessage.property 'htmlId',
    get: -> "user-dialogue-message"

  constructor: (message, confirmLabel, @denyLabel)->
    super(message, confirmLabel)

  init: ->
    super.init()
    $(@markupObj).find("button[data-name='deny']").html(@denyLabel).click(@denyClicked)

  confirmClicked: => @dismiss.dispatch(@, true)

  denyClicked: => @dismiss.dispatch(@, false)

return UserDialogueMessage