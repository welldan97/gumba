# Gumba

Gumba like to live between your shell pipes. When writing scripts is too much
hassle and writing shell function is too much magic you use Gumba.

Installation
------------

Make sure you have [Node.js](http://nodejs.org) & [npm](http://npmjs.org) installed.
You can install Gumba using npm command:

```shell
npm install -g coffee-script
```

Also if you going to using to use it frequently and I hope so, add a shorthand to your shell init file:

```shell
alias u='gumba'
``` 

Usage
-----

With gumba you can use [coffescript](http://coffeescript.org) language powered by [underscore](http://documentcloud.github.com/underscore) & [underscore.string](http://epeli.github.com/underscore.string) inside your command line. Think of Gumba as a kind of `awk`, or `sed`. 

Look at following examples:

### First Example:

before Gumba:

```shell
echo '  IdentityFile "file_path"' | cut -d ' ' -f4 | tr -d '"'
```

after Gumba:

```shell
echo '  IdentityFile "file_path"' | u 'clean().words().last().trim("\"")'
```

Both return `file_path`. So basically `cut -d ' ' -f4 | tr -d` becomes
`u 'clean().words().last().trim("\"")'`. Although first is not so bad,
the second still feels cleaner and easier to remember. This is a real
world example, after which I decided to make Gumba.

### Second Example --- Sed replacement:
Another real world example, from the question on StackOverflow ---
(How to trim
whitespace?)[http://stackoverflow.com/questions/369758/how-to-trim-whitespace-from-bash-variable]

before Gumba:

```shell
echo ' test test test ' | sed -e 's/^ *//g' -e 's/ *$//g'
```

Seriously?

after Gumba:

```shell
echo ' test test test ' | u 'trim()'
```

### More Examples:

Gumba uses just coffeescript so you can make regex replaces easily
using standard javascript functions:

```shell
echo "['bulbasaur' 'chermander' 'pikachu'];" |
u "trim('[];')\                                             # -> 'bulbasaur' 'chermander' 'pikachu'
.replace(/'.*?'/g, (match) -> match.trim('\'').humanize())\ # -> Bulbasaur Chermander Pikachu
.words().toSentence()"                                      # -> Bulbasaur, Chermander and Pikachu
```

Gumba provides `take` function which provides you ability to use
javascript in more flexible way using line object as it's argument:

```shell
echo hi | u 'take (line) -> "#{line.toUpperCase()}!"' # -> !HI!
``

Supported methods
-----------------

Gumba extends standard javascript object prototype with underscore &
underscore.string functions. For example on `String` object you can
use either underscore.string, underscore object or default javascript
methods:

```coffeescript
"Hello World"
  .toUpperCase() # standard javascript
  .capitalize()  # underscore.string
  .isString()    # underscore
```

To have a look on underscore methods reference go [here](http://underscorejs.org),
for underscore.string - [here](https://github.com/epeli/underscore.string)


Function evaluation
-------------------

Every time you pipe to `gumba` it evaluates function passed as argument passed to to each line
of piped stream:

```shell
echo "Hello World" | u 'toUpperCase().take (line) -> "#{line}!"'
```

converts to javascript

```coffeescript
"HelloWorld"
  .toUpperCase()
  .take(function(line){
    return line + "!";
  })
```

Contribute
----------

Fork, Pull, Post issues.
I woul love to get any help in project cultivation.
:sunflower:
