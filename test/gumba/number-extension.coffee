chai = require 'chai'
expect = chai.expect

NumberExtension = require "../../lib/gumba/number-extension"

describe 'NumberExtension', ->
  describe '#apply', ->
    it "adds #numebrFormat method to number object", ->
      expect(5.numberFormat).to.not.be.ok
      NumberExtension::apply()
      expect(5.numberFormat).to.be.ok
