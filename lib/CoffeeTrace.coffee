
StackTrace = require './StackTrace'
File = require './File'
CompiledCoffee = require './CompiledCoffee'
TokenMatcher = require './TokenMatcher'

class CoffeeTrace

  @trace: (err) =>

    stacktrace = new StackTrace err.stack
    fatality = stacktrace.lines[1]
    file = new File fatality.filename

    if /\.coffee$/.test file.filename

      js = new CompiledCoffee file.filename

      return {
        error: err
        fatality: fatality
        file: file
        line: Number TokenMatcher.match file, js.tokens[ fatality.row - 1 ]
      }

    else if /\.js$/.test file.filename

      return {
        error: err
        fatality: fatality
        file: file
        line: Number fatality.row
      }

module.exports = CoffeeTrace