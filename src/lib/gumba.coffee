_ = require 'underscore'
_.str = require 'underscore.string'
CoffeeScript = require 'coffee-script'

_.mixin _.str.exports()

gumba = {}

gumba.init = ->
  extendStandardObjectsUnderscoreFunctions()

gumba.parse = (line, parser)->
  gumba._sandbox line, ->
    gumba._eval "\"#{line}\".#{parser}"

gumba._eval = (value) ->
  eval CoffeeScript.compile value, bare: on

gumba._sandbox = (fallback, cb) ->
  try
    cb() ? fallback
  catch e
    throw e if e instanceof SyntaxError
    fallback


underscoreMethods =
  string: [
    'isBlank', 'stripTags', 'capitalize', 'chop', 'clean', 'count',
    'chars', 'swapCase', 'escapeHTML', 'unescapeHTML', 'escapeRegExp',
    'splice', 'insert', 'join', 'lines', 'startsWith', 'endsWith',
    'succ', 'titleize', 'camelize', 'underscored', 'dasherize',
    'classify', 'humanize', 'trim', 'ltrim', 'rtrim', 'truncate',
    'prune', 'words', 'pad', 'lpad', 'rpad', 'lrpad', 'sprintf',
    'vsprintf', 'toNumber', 'numberFormat', 'strRight', 'strRightBack',
    'strLeft', 'strLeftBack', 'toSentence', 'toSentenceSerial',
    'slugify', 'surround', 'quote', 'exports', 'repeat', 'levenshtein',
    'strip', 'lstrip', 'rstrip', 'center', 'rjust', 'ljust'
    ]
  collection: [
    'each', 'map', 'reduce', 'reduceRight', 'find', 'filter',
    'reject', 'all', 'any', 'include', 'invoke', 'pluck', 'max', 'min',
    'sortBy', 'groupBy', 'sortedIndex', 'shuffle', 'toArray', 'size'
    ]
  arrayMethods: [
    'first', 'initial', 'last', 'rest', 'compact', 'flatten',
    'without', 'union', 'intersection', 'difference', 'uniq', 'zip',
    'indexOf', 'lastIndexOf', 'range'
    ]
  function: [
    'bind', 'bindAll', 'memoize', 'delay', 'defer', 'throttle',
    'debounce', 'once', 'after', 'wrap', 'compose'
    ]
  object: [
    'keys', 'values', 'functions', 'extend', 'defaults', 'clone',
    'tap', 'has', 'isEqual', 'isEmpty', 'isElement', 'isArray',
    'isArguments', 'isFunction', 'isString', 'isNumber', 'isBoolean',
    'isDate', 'isRegExp', 'isNaN', 'isNull', 'isUndefined'
    ]

extendStandardObjectsUnderscoreFunctions = ->
  for method in underscoreMethods.string
    String.prototype[method] = setMethod(method);
  for method in underscoreMethods.object
    Object.prototype[method] = setMethod(method);

setMethod = (method) ->
  ->
    args = Array.prototype.slice.call arguments
    args.unshift this
    _[method].apply _, args

module.exports = gumba