_ = require 'underscore'

AbstractExtension = require "./abstract-extension"

class FunctionExtension extends AbstractExtension
  _methods: [
    'bind', 'bindAll', 'partial', 'memoize', 'delay', 'defer',
    'throttle', 'debounce', 'once', 'after', 'wrap', 'compose'
  ]

  _object: Function
  _extender: _

module.exports = FunctionExtension