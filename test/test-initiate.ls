require! 'mocha'
require! 'chai'
assert = chai.assert
Bot = require '../build/index'

library = "./library"
bot = Bot library

that = it

describe "initiate", ->
   bot.initiate 'login'

   describe "property", ->

      that "should load into @initial", ->
         assert.property bot, 'initial'

   describe "value", ->

      that "should be a function", ->
         assert.isFunction bot.initial
