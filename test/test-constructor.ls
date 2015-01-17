require! 'mocha'
require! 'chai'
assert = chai.assert
Bot = require '../build/index'

library = "./library"
bot = Bot library

that = it

describe "constructor", ->

   that "should load the library path to @library", ->
      assert.propertyVal bot, 'library', './library'
