require! 'mocha'
require! 'chai'
assert = chai.assert
Bot = require '../build/index'

library = "./library"
bot = Bot library

that = it

describe "run", ->
   mod-obj =
      add: [5 3]
      subtract: [10 5]
   bot.load 'add'

   that "should not throw an error", ->
      run = -> bot.run mod-obj
      assert.doesNotThrow run

   that "unless if the error-throwing module is loaded", ->
      bot.load 'alert'
      run = -> bot.run mod-obj
      assert.throws run
