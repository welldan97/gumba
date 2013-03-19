_ = require 'underscore'
_.str = require 'underscore.string'
CoffeeScript = require 'coffee-script'

_.mixin _.str.exports()

ArrayExtension = require './gumba/array-extension'
FunctionExtension = require './gumba/function-extension'
NumberExtension = require './gumba/number-extension'
ObjectExtension = require './gumba/object-extension'
StringExtension = require './gumba/string-extension'

Gumba = {}

Gumba.init = ->
  ArrayExtension::apply()
  FunctionExtension::apply()
  NumberExtension::apply()
  ObjectExtension::apply()
  StringExtension::apply()

Gumba.parse = (line, parser)->
  Gumba._sandbox line, ->
    Gumba._eval "\"#{line}\".#{parser}"

Gumba._eval = (value) ->
  eval CoffeeScript.compile value, bare: on

Gumba._sandbox = (fallback, cb) ->
  try
    cb() ? fallback
  catch e
    throw e if e instanceof SyntaxError
    fallback

module.exports = Gumba