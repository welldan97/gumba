chai = require 'chai'
expect = chai.expect

StringExtension = require "../../../lib/gumba/extensions/string-extension"

describe 'StringExtension', ->
  describe '#apply', ->
    it "adds underscore.string methods to string object", ->
      expect('string'.capitalize).to.not.be.ok
      StringExtension::apply()
      expect('string'.capitalize).to.be.ok
