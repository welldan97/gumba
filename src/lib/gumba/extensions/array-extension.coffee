_ = require 'underscore'
_s = require 'underscore.string'

_.mixin
  toSentence: _s.toSentence
  toSentenceSerial: _s.toSentenceSerial

AbstractExtension = require "./abstract-extension"

class ArrayExtension extends AbstractExtension
  _methods: [
    'toSentence', 'toSentenceSerial', 'first', 'initial', 'last',
    'rest', 'compact', 'flatten', 'without', 'union', 'intersection',
    'difference', 'uniq', 'zip', 'object', 'indexOf', 'lastIndexOf',
    'sortedIndex', 'range'
  ]

  _object: Array
  _extender: _

module.exports = ArrayExtension