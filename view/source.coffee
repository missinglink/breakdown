
header = require './header'

module.exports = (stackLine,settings={margin:3}) ->

  header stackLine, 'Source'

  stackLine.row = Number( stackLine.row )

  for i in [(stackLine.row - settings.margin)..(stackLine.row + settings.margin)]

    if line = stackLine.file.lines[ i - 1 ]

      line = line.substr( 0, 80 )

      if stackLine.row is Number i

        console.error " \x1b[1;31m✘\x1b[36m #{i}: \x1b[1;37m#{line}\x1b[0m"

      else

        console.error " \x1b[0;36m  #{i}: \x1b[1;30m#{line}\x1b[0m"