addMock "message1",
  type : "mock1"
  message : "Mock message number 1."
  dismiss :
    add : ->
  init: ->
  getHtml: -> "<article id='message-1234'><p>Mock message number 1.</p></article>"

addMock "message2",
  type : "mock2"
  message : "Mock message number 2."
  dismiss :
    add : ->
  init: ->
  getHtml: -> "<article id='message-1234'><p>Mock message number 2.</p></article>"

addMock "timeMessage",
  type : "time"
  message : "Time message."
  dismiss :
    add : ->

addMock "messageBuilder",
  canHandle : (type)->
    type is "mock"
  handle : (message, options)->
    return mocks.message1 if message is "mock1"
    return mocks.message2 if message is "mock2"

addMock "systemMessageManager",
  queueMessage: (type, message, options)->
  queueMessageAt: (type, message, options, index)->
  removeMessage: (message)->
  displayMessage: (message)->