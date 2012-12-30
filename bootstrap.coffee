
#
# Coffee-Trace: Simpler and better way to match corresponding javascript 
# line when debuging CoffeeScript.
#
# just require this in your code and be happy...
#

CoffeeTrace = require './lib/CoffeeTrace'
coffeetrace = new CoffeeTrace

views =
  header: require './view/header'
  source: require './view/source'
  help: require './view/help'
  stacktrace: require './view/stacktrace'
  newline: -> console.log()

process.on 'uncaughtException', (err) ->

  trace = CoffeeTrace.trace err
  if trace

    views.newline()
    views.stacktrace trace
    views.newline()

    views.header
      title: 'Source'
      error: trace.line
      filename: trace.file.filename

    views.source
      lines: trace.file.lines
      error: trace.line
      margin: 3

    views.help trace

  else console.error err.stack

  views.newline()
  process.exit()