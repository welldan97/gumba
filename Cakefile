{exec} = require 'child_process'

task 'build', 'Compile CoffeeScript source files', ->
  exec 'mkdir -p lib bin', (err, stdout, stderr) ->
    throw new Error(err) if err
    exec "coffee --compile --output lib/ src/lib/", (err, stdout, stderr) ->
      throw new Error(err) if err
    exec "coffee --compile --output bin/ src/bin/", (err, stdout, stderr) ->
      throw new Error(err) if err

task 'test', 'Test project', ->
  exec "mocha --compilers coffee:coffee-script", (err, output) ->
    throw err if err
    console.log output
