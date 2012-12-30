path = require 'path'

module.exports = (stackLine,title) ->

  if stackLine.file

    filename = stackLine.file.filename.replace process.cwd(), '.'
    console.error "\x1b[0;33m #{title}:\x1b[0m\x1b[1;37m #{filename}\x1b[33m:\x1b[1;34m#{stackLine.row}\x1b[0m"