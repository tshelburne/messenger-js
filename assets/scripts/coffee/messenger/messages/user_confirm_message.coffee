require "patches"
require "lib/jquery"
Message = require "messenger/messages/message"

#
# @author - Tim Shelburne <tim@musiconelive.com>
#
# a message dismissed from a user
#
class UserConfirmMessage extends Message

  UserConfirmMessage.property 'type',
    get: -> "confirm"

  UserConfirmMessage.property 'htmlId',
    get: -> "user-confirm-message"

  constructor: (@message, @confirmLabel)->
    super(@message)
    $("button[data-name='confirm']", @markupObj).html(@confirmLabel)

  init: ->
    $("button[data-name='confirm']", "##{@uid}").click(@confirmClicked)

  confirmClicked: => @dismiss.dispatch(@)

return UserConfirmMessage