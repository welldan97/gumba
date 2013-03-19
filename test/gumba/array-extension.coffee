chai = require 'chai'
expect = chai.expect

ArrayExtension = require "../../lib/gumba/array-extension"

describe 'ArrayExtension', ->
  describe '#apply', ->
    it "adds underscore methods to array object", ->
      expect([].first).to.not.be.ok
      expect([].toSentence).to.not.be.ok
      ArrayExtension::apply()
      expect([].first).to.be.ok
      expect([].toSentence).to.be.ok
