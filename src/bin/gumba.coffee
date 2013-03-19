_s = require 'underscore.string'
Gumba = require '../lib/gumba'

main = ->
  parser = getArguments()
  Gumba.init()

  stream (line)->
    Gumba.parse line, parser

getArguments = ->
  process.argv[2..].join ' '

stream = (cb) ->
  process.stdin.resume()
  process.stdin.setEncoding 'utf8'

  process.stdin.on 'data', (chunk) ->
    for line in _s.lines chunk.rtrim()
      process.stdout.write "#{cb(line)}\n"

main()