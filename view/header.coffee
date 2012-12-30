path = require 'path'

module.exports = (fileInfo) ->

  console.error "\x1b[0;33m #{fileInfo.title}:\x1b[0m\x1b[1;37m #{fileInfo.filename}\x1b[33m:\x1b[1;34m#{fileInfo.error}\x1b[0m"