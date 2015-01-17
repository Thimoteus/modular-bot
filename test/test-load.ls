require! 'mocha'
require! 'chai'
assert = chai.assert
Bot = require '../build/index'

library = "./library"
bot = Bot library

that = it

describe "load", ->

   describe "one", ->

      that "should make a nonempty @mods property", ->
         bot.load "sayHi"
         assert.property bot, 'mods'

   describe "array", ->

      that "should load two modules into @mods", ->
         bot.load ['sayHi', 'add']
         assert.deepProperty bot, 'mods', 'sayHi'
         assert.deepProperty bot, 'mods', 'add'

describe "load-all", ->

   that "should load all mods into @mods", ->
      bot.load-all!
      assert.deepProperty bot, 'mods.add'
      assert.deepProperty bot, 'mods.subtract'
      assert.deepProperty bot, 'mods.sayHi'
      assert.deepProperty bot, 'mods.alert'

describe "unload-all", ->

   that "should unload all mods", ->
      bot.unload-all!
      assert.deepEqual bot.mods, {}
      
describe "unload", ->

   that "should make an empty @mods property", ->
      bot.load "sayHi"
      bot.unload 'sayHi'
      assert.deepEqual bot.mods, {}
