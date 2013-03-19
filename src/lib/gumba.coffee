_ = require 'underscore'
_.str = require 'underscore.string'
CoffeeScript = require 'coffee-script'

_.mixin _.str.exports()

ArrayExtension = require './gumba/array-extension'
FunctionExtension = require './gumba/function-extension'
NumberExtension = require './gumba/number-extension'
ObjectExtension = require './gumba/object-extension'
StringExtension = require './gumba/string-extension'

gumba = {}

gumba.init = ->
  ArrayExtension::apply()
  FunctionExtension::apply()
  NumberExtension::apply()
  ObjectExtension::apply()
  StringExtension::apply()

gumba.parse = (line, parser)->
  gumba._sandbox line, ->
    gumba._eval "\"#{line}\".#{parser}"

gumba._eval = (value) ->
  eval CoffeeScript.compile value, bare: on

gumba._sandbox = (fallback, cb) ->
  try
    cb() ? fallback
  catch e
    throw e if e instanceof SyntaxError
    fallback

module.exports = gumba