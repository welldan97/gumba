chai = require 'chai'
expect = chai.expect

AbstractExtension = require "../../lib/gumba/abstract-extension"

describe 'AbstractExtension', ->
  _ = example: (object) -> "#{object}!"

  class ExampleExtension extends AbstractExtension
    _methods: ['example']
    _object: String
    _extender: _

  describe '#apply', ->
    it "adds all methods to object", ->
      expect('hello'.example).to.not.be.ok
      ExampleExtension::apply()
      expect('hello'.example).to.be.ok
      expect('hello'.example()).to.equal 'hello!'

  describe '#_setMethod', ->
    it "add passed method to object", ->
      String::method = ExampleExtension::_setMethod 'example'
      expect('hello'.method()).to.equal 'hello!'
