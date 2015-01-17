module.exports =
   login: (cb) ->
      console.log "logged in!"
      cb!
   add: (x, y) -> x + y
   subtract: (x, y) -> x - y
   say-hi: -> console.log 'hi!'
   alert: ->
      console.log "POOOOP"
      throw new Error "uh oh!"
