TimeDismissedMessage = require "messenger/messages/time_dismissed_message"

describe "TimeDismissedMessage", ->
  message = null

  beforeEach ->
    message = new TimeDismissedMessage("Time message.", 50)
    spyOn(message.dismiss, "dispatch")
    jasmine.Clock.useMock()

  it "can dismiss after a given amount of time", ->
    message.init()
    jasmine.Clock.tick(51)
    expect(message.dismiss.dispatch).toHaveBeenCalledWith message