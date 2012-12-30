
module.exports = (source) ->

  for i in [(source.error - source.margin)..(source.error + source.margin)]

    if line = source.lines[ i - 1 ]

      line = line.substr( 0, 50 )

      if source.error is Number i

        console.error " \x1b[1;31m✘\x1b[36m #{i}: \x1b[1;37m#{line}\x1b[0m"

      else

        console.error " \x1b[0;36m  #{i}: \x1b[1;30m#{line}\x1b[0m"