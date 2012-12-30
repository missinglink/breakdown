path = require 'path'
header = require './header'
source = require './source'

File = require '../lib/File'

StackTraceLine = require '../lib/StackTraceLine'

module.exports = (trace) ->

  #console.log trace.error.stack

  file = path.basename trace.stack.lines[0].file.filename
  stack = trace.error.stack.split "\n"

  for ordinal, line of stack
    if 0 is Number ordinal

      switch line.replace /^([^:]+):(.+)/, "$1"

        when 'ReferenceError'

          typo = line.replace( /^([^:]+): (.+) is not defined/, "'$2' " ) || ''
          console.error "\x1b[1;36m Help:\x1b[0m"
          console.error "  \x1b[0m Spelling mistake #{typo}in #{file} on line #{trace.line}\x1b[0m"
          console.error "  \x1b[0m Missing a require() statement for #{typo}\x1b[0m"
          console.log()

        when 'Error'

          if [ {}, filename, line ] = line.match /Error: In (.+), Parse error on line (\w+): Unexpected 'INDENT'/

            console.error "\x1b[1;36m Help:\x1b[0m"
            console.error "  \x1b[0m Invalid coffee-script syntax at #{filename}:#{line}\x1b[0m"
            console.error "  \x1b[0m Inconsistent coffee-script indentation in #{filename}\x1b[0m"
            console.log()

            newtrace = new StackTraceLine "(#{filename}:#{line}:0)"
            newtrace.file = new File filename
            header newtrace, 'CoffeeScript'
            source newtrace

