path = require 'path'

module.exports = (trace) ->

  #console.log trace.error.stack

  file = path.basename trace.stack.lines[0].file.filename
  stack = trace.error.stack.split "\n"

  for ordinal, line of stack
    if 0 is Number ordinal

      switch line.replace /^([^:]+):(.+)/, "$1"

        when 'ReferenceError'

          typo = line.replace( /^([^:]+): (.+) is not defined/, "'$2' " ) || ''
          console.error "\x1b[0;33m Help:\x1b[0m"
          console.error "  \x1b[0m Spelling mistake #{typo}in #{file} on line #{trace.line}\x1b[0m"
          console.error "  \x1b[0m Missing a require() statement for #{typo}\x1b[0m"
          console.log()

        when 'Error'

          if [ {}, file, line ] = line.match /Error: In (.+), Parse error on line (\w+): Unexpected 'INDENT'/

            console.error "\x1b[0;33m Help:\x1b[0m"
            console.error "  \x1b[0m Invalid coffee-script at line #{line} in #{file}\x1b[0m"
            console.error "  \x1b[0m Inconsistent coffee-script indentation in #{file}\x1b[0m"
            console.log()