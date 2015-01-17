require! 'mocha'
require! 'chai'
assert = chai.assert
Bot = require '../build/index'

library = "./library"
bot = Bot library, __dirname

that = it

describe "constructor", ->

   that "should load the library path to @library", ->
      assert.include bot.library, 'library'
