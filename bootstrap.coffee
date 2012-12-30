
#
# Coffee-Trace: Simpler and better way to match corresponding javascript 
# line when debuging CoffeeScript.
#
# just require this in your code and be happy...
#

Trace = require './lib/Trace'

views =
  source: require './view/source'
  help: require './view/help'
  stacktrace: require './view/stacktrace'
  newline: -> console.log()

process.on 'uncaughtException', (err) ->

  trace = new Trace err
  if trace

    views.newline()
    views.stacktrace trace
    views.newline()

    for line in trace.stack.lines[0..0]

      if line.file
        views.source line, title: 'Thrown', margin: 2
        views.newline()

    views.help trace

  else console.error err.stack

  process.exit()