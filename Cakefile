{exec} = require 'child_process'

task 'build', 'Compile CoffeeScript source files', ->
  exec 'mkdir -p lib bin', (err, stdout, stderr) ->
    throw new Error(err) if err

    exec "coffee --compile --output lib/ src/lib/", (err, stdout, stderr) ->
      throw new Error(err) if err

    exec "echo '#\!/usr/bin/env node' > bin/gumba.js", (err, stdout, stderr) ->
      throw new Error(err) if err
      exec "coffee --compile -p src/bin/gumba.coffee >> bin/gumba.js", (err, stdout, stderr) ->
        throw new Error(err) if err

task 'test', 'Test project', ->
  exec "mocha --recursive --compilers coffee:coffee-script", (err, output) ->
    throw err if err
    console.log output
