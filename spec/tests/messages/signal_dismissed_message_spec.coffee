SignalDismissedMessage = require "messenger/messages/signal_dismissed_message"
Signal = require "cronus/signal"

describe "SignalDismissedMessage", ->
  message = null
  signal = new Signal()

  beforeEach ->
    message = new SignalDismissedMessage("Signal message.", signal, 0)
    spyOn(message.dismiss, "dispatch")
    jasmine.Clock.useMock()

  it "can dismiss upon receiving a dispatch from the signal", ->
    message.init()
    signal.dispatch()
    jasmine.Clock.tick(100)
    expect(message.dismiss.dispatch).toHaveBeenCalledWith message

  it "can suspend dismissal until after a set amount of time has passed", ->
    message.minTimeToShow = 200
    message.init()
    signal.dispatch()
    expect(message.dismiss.dispatch).not.toHaveBeenCalled()
    jasmine.Clock.tick 201
    expect(message.dismiss.dispatch).toHaveBeenCalledWith message