path = require 'path'

module.exports = (trace) ->

  errorstack = trace.error.stack.split("\n")

  title = errorstack[0].replace process.cwd(), '.'
  console.error title.replace(/^(\w+): /, " \x1b[1;36m$1:\x1b[0m \x1b[1;33m") + "\x1b[0m "

  for ordinal, line of errorstack[1..]

    output = line

    trace.stack.lines.map (stackLine) ->      
      output = output.replace stackLine.line, "#{stackLine.filename}:\x1b[1;34m#{stackLine.row}\x1b[0m"

    output = output.replace process.cwd(), '.'
    output = output.replace /\((.+)\)/, "$1"
    output = output.replace /^(\s+)at ([^\s]+)/, "\x1b[1m   $2()\x1b[0m"
    console.error output

  #console.error stack.replace /\d+:\d+/, "\x1b[1;34m#{trace.coffee.line}\x1b[0m"