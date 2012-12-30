
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

    totalLines = 1
    hadCoffee = false

    for line in trace.stack.lines[0..(totalLines-1)]

      if line.file
        views.source line, title: 'Thrown', margin: 2
        views.newline()
        hadCoffee = true

    if not hadCoffee
      for line in trace.stack.lines[totalLines..]
        if /\.coffee$/.test line.filename
          if line.file
            views.source line, title: 'CoffeeScript', margin: 2
            views.newline()
            break

    views.help trace

  else console.error err.stack