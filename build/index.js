// Generated by LiveScript 1.3.1
(function(){
  var apply, ModularBot, toString$ = {}.toString;
  apply = function(f, list){
    return f.apply(null, list);
  };
  ModularBot = (function(){
    ModularBot.displayName = 'ModularBot';
    var prototype = ModularBot.prototype, constructor = ModularBot;
    function ModularBot(library){
      var this$ = this instanceof ctor$ ? this : new ctor$;
      this$.library = library;
      this$.mods = {};
      this$.initial = void 8;
      return this$;
    } function ctor$(){} ctor$.prototype = prototype;
    prototype.initiate = function(init){
      var f;
      f = require(this.library)[init];
      this.initial = f;
    };
    prototype.loadOne = function(aMod){
      var theMod, addition, ref$;
      theMod = require(this.library)[aMod];
      if (theMod == null) {
        throw new Error("Module does not exist");
      }
      addition = (ref$ = {}, ref$[aMod + ""] = theMod, ref$);
      import$(this.mods, addition);
      console.log("module " + aMod + " loaded");
      return true;
    };
    prototype.load = function(mods){
      var i$, len$;
      if (toString$.call(mods).slice(8, -1) === 'Array') {
        for (i$ = 0, len$ = mods.length; i$ < len$; ++i$) {
          (fn$.call(this, mods[i$]));
        }
      } else if (toString$.call(mods).slice(8, -1) === 'String') {
        this.loadOne(mods);
      } else {
        throw new Error("What are you trying to load?");
      }
      return true;
      function fn$(modl){
        this.loadOne(modl);
      }
    };
    prototype.loadAll = function(){
      var k, ref$, v;
      for (k in ref$ = require(this.library)) {
        v = ref$[k];
        if (v !== this.initial) {
          this.mods[k] = v;
        }
      }
      console.log("all modules loaded");
      return true;
    };
    prototype.unloadAll = function(){
      this.mods = {};
      console.log("all modules unloaded");
      return true;
    };
    prototype.unload = function(aMod){
      var mods, key, ref$, value;
      if (!(aMod in this.mods)) {
        throw new Error("Cannot unload module");
      }
      mods = {};
      for (key in ref$ = this.mods) {
        value = ref$[key];
        if (key !== aMod) {
          mods[key] = value;
        }
      }
      this.mods = mods;
    };
    prototype.run = function(modObj, exceptions){
      var run, this$ = this;
      modObj == null && (modObj = {});
      exceptions == null && (exceptions = []);
      if (toString$.call(modObj).slice(8, -1) === 'Array') {
        exceptions = modObj;
        modObj = {};
      }
      run = function(){
        var i$, ref$, results$ = [];
        for (i$ in ref$ = this$.mods) {
          if (!in$(i$, exceptions)) {
            results$.push((fn$.call(this$, i$, ref$[i$])));
          }
        }
        return results$;
        function fn$(key, value){
          if (key in modObj) {
            return apply(value, modObj[key]);
          } else {
            return this.mods[key]();
          }
        }
      };
      if (toString$.call(this.initial).slice(8, -1) === 'Function') {
        this.initial(function(){
          return run();
        });
      } else {
        run();
      }
    };
    return ModularBot;
  }());
  module.exports = ModularBot;
  function import$(obj, src){
    var own = {}.hasOwnProperty;
    for (var key in src) if (own.call(src, key)) obj[key] = src[key];
    return obj;
  }
  function in$(x, xs){
    var i = -1, l = xs.length >>> 0;
    while (++i < l) if (x === xs[i]) return true;
    return false;
  }
}).call(this);