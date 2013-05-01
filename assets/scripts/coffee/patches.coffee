require "lib/define_property"

Function::property = (prop, desc) ->
  Object.defineProperty @prototype, prop, desc