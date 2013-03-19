_ = require 'underscore'
takeMixin = require '../take'

_.mixin takeMixin

AbstractExtension = require "./abstract-extension"

class ObjectExtension extends AbstractExtension
  _methods: [
    'take', 'keys', 'values', 'pairs', 'invert', 'functions',
    'extend', 'pick', 'omit', 'defaults', 'clone', 'tap', 'has',
    'isEqual', 'isEmpty', 'isElement', 'isArray', 'isObject',
    'isArguments', 'isFunction', 'isString', 'isNumber', 'isFinite',
    'isBoolean', 'isDate', 'isRegExp', 'isNaN', 'isNull'
#    'isUndefined'
  ]

  _object: Object
  _extender: _

module.exports = ObjectExtension