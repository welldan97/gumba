chai = require 'chai'
expect = chai.expect

{exec} = require 'child_process'

#exec 'echo hi | bin/gumba.js "capitalize()"', (err, stdout, stderr) ->
#  console.log stdout

describe 'Gumba command', ->
  u = 'bin/gumba'
  
  it 'processes first exapmle from Readme', (done) ->
    echo = 'echo "  IdentityFile \\"file_path\\""'
    gumba = "#{u} \"clean().words().last().trim('\\\"')\""
    exec "#{echo} | #{gumba}", (err, stdout, stderr) ->
      expect(stdout).to.equal 'file_path\n'
      done()

  it 'processes second exapmle from Readme', (done) ->
    echo = 'echo " test test test "'
    gumba = "#{u} \"trim()\""
    exec "#{echo} | #{gumba}", (err, stdout, stderr) ->
      expect(stdout).to.equal 'test test test\n'
      done()

  it 'processes third exapmle from Readme', (done) ->
    echo = "echo \"['bulbasaur' 'chermander' 'pikachu'];\""
    gumba = "#{u} \"trim('[];').replace(/'.*?'/g, (match) -> match.trim('\\'').humanize()).words().toSentence()\""
    exec "#{echo} | #{gumba}", (err, stdout, stderr) ->
      expect(stdout).to.equal 'Bulbasaur, Chermander and Pikachu\n'
      done()
  it 'processes fourth exapmle from Readme', (done) ->
    echo = "echo hi"
    gumba = "#{u} \"take (line) -> line.toUpperCase() + '!'\""
    exec "#{echo} | #{gumba}", (err, stdout, stderr) ->
      expect(stdout).to.equal 'HI!\n'
      done()