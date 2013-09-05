Breakdown
=========
Top class error reporting for js & coffee-script

Install
--------

```bash
npm install breakdown
```

Configure
---------
Breakdown will handle all uncaught exceptions

```coffee-script
# Far better error stack debugging. Do not use in production!
unless process.env.NODE_ENV

  # Breakdown will handle all uncaught exceptions
  breakdown = require 'breakdown'

  # Set as default error handler for express
  app.use (err,req,res,next) ->
    breakdown err
    res.writeHead 500, 'Content-Type': 'text/plain'
    res.end err.stack
```

Usage
-----

```coffee-script
breakdown = require 'breakdown'
breakdown new Error 'Hello World'
```

Example
-------
```
TypeError: Cannot read property 'first_name' of undefined
    at test (/var/www/breakdown/test/test.coffee:22:53)
    at delegate (/var/www/breakdown/test/test.coffee:28:12)
    at process.startup.processNextTick.process._tickCallback (node.js:244:9)
```

Screenshot
----------
![Breakdown](https://github.com/missinglink/breakdown/raw/master/img/screenshot.png "Breakdown")

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/missinglink/breakdown/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

