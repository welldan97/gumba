_ = require 'underscore'
_.str = require 'underscore.string'
CoffeeScript = require 'coffee-script'

takeMixin = require './gumba/take'

_.mixin _.str.exports()
_.mixin takeMixin

ArrayExtension = require './gumba/extensions/array-extension'
FunctionExtension = require './gumba/extensions/function-extension'
NumberExtension = require './gumba/extensions/number-extension'
ObjectExtension = require './gumba/extensions/object-extension'
StringExtension = require './gumba/extensions/string-extension'

Gumba = {}

Gumba.init = ->
  ArrayExtension::apply()
  FunctionExtension::apply()
  NumberExtension::apply()
  ObjectExtension::apply()
  StringExtension::apply()

Gumba.parse = (line, parser)->
  Gumba._sandbox line, ->
    Gumba._eval line, parser

Gumba._eval = (line, parser) ->
  eval CoffeeScript.compile "line.#{parser}", bare: on


Gumba._sandbox = (fallback, cb) ->
  try
    cb() ? fallback
  catch e
    throw e if e instanceof SyntaxError
    fallback

module.exports = Gumba