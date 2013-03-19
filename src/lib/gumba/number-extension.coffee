_s = require 'underscore.string'
AbstractExtension = require "./abstract-extension"

class NumberExtension extends AbstractExtension
  _methods: ['numberFormat' ]

  _object: Number
  _extender: _s

module.exports = NumberExtension