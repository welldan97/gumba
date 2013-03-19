chai = require 'chai'
expect = chai.expect

{take} = require "../../lib/gumba/take"

describe 'take', ->
  it 'it applies callback to object supplied as argument', ->
    expect(
      take 'object', (v) ->
        "#{v}!"
      ).to.equal 'object!'

