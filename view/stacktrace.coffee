path = require 'path'

module.exports = (trace) ->
  
  stack = trace.error.stack.split "\n"

  for ordinal, line of stack

    line = line.replace path.dirname(module.parent.filename), '.'

    if 0 is Number ordinal

      line = line.replace /(\w+): /, " \x1b[0;33m$1:\x1b[0m "
      console.error line

    else

      if 1 is Number ordinal and trace.coffee?.line
        line = line.replace /\d+:\d+/, "\x1b[1;34m#{trace.coffee.line}\x1b[0m"

      # line = line.replace 
      line = line.replace /\((.+)\)/, "$1"
      line = line.replace /^(\s+)at ([^\s]+)/, "\x1b[0;36m   $2()\x1b[0m"
      console.error line

  #console.error stack.replace /\d+:\d+/, "\x1b[1;34m#{trace.coffee.line}\x1b[0m"