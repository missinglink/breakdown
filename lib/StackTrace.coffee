
StackTraceLine = require './StackTraceLine'

class StackTrace

  constructor: ( stack ) ->

    @lines = []
    stack.split( "\n" ).map ( line ) => @lines.push new StackTraceLine line

module.exports = StackTrace