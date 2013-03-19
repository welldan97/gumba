chai = require 'chai'
expect = chai.expect

ObjectExtension = require "../../../lib/gumba/extensions/object-extension"

describe 'ObjectExtension', ->
  describe '#apply', ->
    it "adds underscore methods to object", ->
      expect({}.keys).to.not.be.ok
      expect({}.take).to.not.be.ok
      ObjectExtension::apply()
      expect({}.keys).to.be.ok
      expect({}.take).to.be.ok
