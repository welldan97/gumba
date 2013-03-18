CoffeeScript = require 'coffee-script'
chai = require 'chai'
expect = chai.expect

gumba = require "../lib/gumba"

describe 'gumba', ->
  describe '#init', ->
    it 'should extend standard objects with underscore functions', ->
      expect(-> "Hello World".capitalize()).to.throw()
      gumba.init()
      expect(-> "Hello World".capitalize()).to.not.throw()

  describe '#parse', ->
    it 'should parse line', ->
      expect(
        gumba.parse "hello World", "capitalize()"
      ).to.equal "Hello World"

  describe '#_eval', ->
    it 'should eval coffeescript', ->
      expect(
        gumba._eval '"12#{3}45"'
      ).to.equal "12345"

  describe '#_sandbox', ->
    it 'should throw coffeescript compilation errors', ->
      expect( ->
        gumba._sandbox 'fallback', ->
          CoffeeScript.compile "(123"
      ).to.throw(SyntaxError)

    it 'should suppress other kinds of errors', ->
      expect( ->
        gumba._sandbox 'fallback', ->
          (undefined)[5]
      ).to.not.throw()

    it 'should return fallback on error input', ->
      expect(
        gumba._sandbox 'fallback', ->
          (undefined)[5]
      ).to.equal 'fallback'
