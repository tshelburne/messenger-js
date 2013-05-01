require "lib/jquery"
Signal = require "cronus/signal"

#
# @author - Tim Shelburne <tim@musiconelive.com>
#
# a basic message interface
#
class Message

  constructor: (message)->
    @uid = "message-#{Date.now()}"
    @buildMarkupObj(message)
    @dismiss = new Signal()

  init: ->

  buildMarkupObj: (message)->
    @markup = document.getElementById(@htmlId).innerHTML
    @markupObj = $("<article id='#{@uid}'>#{@markup}</article>")
    @markupObj.find("p").html(message)

  getHtml: ->
    @markupObj.clone().wrap("<p>").parent().html()

return Message