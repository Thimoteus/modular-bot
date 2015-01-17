# modular-bot [![Build Status](https://travis-ci.org/Thimoteus/modular-bot.svg?branch=master)](https://travis-ci.org/Thimoteus/modular-bot)
A tool for running bots piece-wise.

## Example

```coffeescript
Bot = require 'modular-bot'
bot = new Bot './path-to-library'

bot.initiate 'login'
bot.load 'sayHello'

bot.run()
```

in `./path-to-library`:

```coffeescript
module.exports =
   login: (callback) ->
      console.log "logged in!"
      callback()
   sayHello: ->
      console.log "hello!"
```
