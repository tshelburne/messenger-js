MultiSignalDismissedMessage = require "messenger/messages/multi_signal_dismissed_message"

Signal = require "cronus/signal"

describe "MultiSignalDismissedMessage", ->
  message = null
  signal1 = new Signal()
  signal2 = new Signal()

  beforeEach ->
    message = new MultiSignalDismissedMessage("Signal message.", [ signal1, signal2 ], 0)
    spyOn(message.dismiss, "dispatch")
    jasmine.Clock.useMock()

  it "can dismiss upon receiving a dispatch from one signal", ->
    message.init()
    signal1.dispatch()
    jasmine.Clock.tick(100)
    expect(message.dismiss.dispatch).toHaveBeenCalledWith message

  it "can dismiss upon receiving a dispatch from another signal", ->
    message.init()
    signal2.dispatch()
    jasmine.Clock.tick(100)
    expect(message.dismiss.dispatch).toHaveBeenCalledWith message

  it "can suspend dismissal until after a set amount of time has passed", ->
    message.minTimeToShow = 200
    message.init()
    signal1.dispatch()
    expect(message.dismiss.dispatch).not.toHaveBeenCalled()
    jasmine.Clock.tick 201
    expect(message.dismiss.dispatch).toHaveBeenCalledWith message