apply = (f, list) -> f.apply null, list

class ModularBot
   (@library) ~>
      @mods = {}
      @initial = void

   initiate: (init) !->
      f = require(@library)[init]
      @initial = f

   load-one: (a-mod) !->
      the-mod = require(@library)[a-mod]
      throw new Error "Module does not exist" if not the-mod?
      addition = "#{a-mod}": the-mod
      @mods <<< addition
      console.log "module #{a-mod} loaded"
      return true

   load: (mods) !->
      if typeof! mods is 'Array'
         for let modl in mods => @load-one modl
      else if typeof! mods is 'String'
         @load-one mods
      else
         throw new Error "What are you trying to load?"
      return true

   load-all: !->
      for k, v of require @library when v isnt @initial
         @mods[k] = v
      console.log "all modules loaded"
      return true

   unload-all: !->
      @mods = {}
      console.log "all modules unloaded"
      return true

   unload: (a-mod) !->
      throw new Error "Cannot unload module" if a-mod not of @mods
      mods = {}
      for key, value of @mods when key isnt a-mod
         mods[key] = value
      @mods = mods

   run: (mod-obj = {}, exceptions = []) !->
      # mod-obj is a dictionary of the form
      # module-name: [module-arguments...]
      if typeof! mod-obj is 'Array'
         exceptions = mod-obj
         mod-obj = {}
      run = ~>
         for let key, value of @mods when key not in exceptions
            if key of mod-obj
               apply value, mod-obj[key]
            else
               @mods[key]!

      if typeof! @initial is 'Function'
         @initial -> run!
      else
         run!

module.exports = ModularBot
