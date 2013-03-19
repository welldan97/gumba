CoffeeScript = require 'coffee-script'
chai = require 'chai'
expect = chai.expect

Gumba = require "../lib/gumba"

describe 'Gumba', ->
  describe '#init', ->
    it 'should not fail', ->
      expect( ->
        Gumba.init()
      ).to.not.throw()
  describe '#parse', ->
    it 'should parse line', ->
      expect(
        Gumba.parse "hello World", "capitalize()"
      ).to.equal "Hello World"
      
  describe '#_eval', ->
    it 'should eval coffeescript', ->
      expect(
        Gumba._eval "abc","toUpperCase()"
      ).to.equal "ABC"

  describe '#_sandbox', ->
    it 'should throw coffeescript compilation errors', ->
      expect( ->
        Gumba._sandbox 'fallback', ->
          CoffeeScript.compile "(123"
      ).to.throw(SyntaxError)

    it 'should suppress other kinds of errors', ->
      expect( ->
        Gumba._sandbox 'fallback', ->
          (undefined)[5]
      ).to.not.throw()

    it 'should return fallback on error input', ->
      expect(
        Gumba._sandbox 'fallback', ->
          (undefined)[5]
      ).to.equal 'fallback'
