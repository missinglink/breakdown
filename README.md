Breakdown
=========
Top class error reporting for js & coffee-script

Install
--------

```coffee-script
# Far better error stack debugging. Do not use in production!
if not process.env.NODE_ENV

  # Breakdown will handle all uncaught exceptions
  breakdown = require 'breakdown'

  # Set as default error handler for express
  app.use (err,req,res,next) ->
    breakdown err
    res.writeHead 500, 'Content-Type': 'text/plain'
    res.end err.stack
```