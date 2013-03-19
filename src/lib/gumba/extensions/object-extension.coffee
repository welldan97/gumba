_ = require 'underscore'
AbstractExtension = require "./abstract-extension"

class ObjectExtension extends AbstractExtension
  _methods: [
    'keys', 'values', 'pairs', 'invert', 'functions', 'extend',
    'pick', 'omit', 'defaults', 'clone', 'tap', 'has', 'isEqual',
    'isEmpty', 'isElement', 'isArray', 'isObject', 'isArguments',
    'isFunction', 'isString', 'isNumber', 'isFinite', 'isBoolean',
    'isDate', 'isRegExp', 'isNaN', 'isNull', 'isUndefined'
  ]

  _object: Object
  _extender: _

module.exports = ObjectExtension