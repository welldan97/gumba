chai = require 'chai'
expect = chai.expect

FunctionExtension = require "../../lib/gumba/function-extension"

describe 'FunctionExtension', ->
  describe '#apply', ->
    it "adds underscore methods to function object", ->
      expect((->).memoize).to.not.be.ok
      FunctionExtension::apply()
      expect((->).memoize).to.be.ok
