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

Screenshot
----------
![Breakdown](https://github.com/missinglink/breakdown/raw/master/img/screenshot.png "Breakdown")