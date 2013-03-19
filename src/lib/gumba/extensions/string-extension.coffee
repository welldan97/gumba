_s = require 'underscore.string'
AbstractExtension = require "./abstract-extension"

class StringExtension extends AbstractExtension
  _methods: [
    'isBlank', 'stripTags', 'capitalize', 'chop', 'clean', 'count',
    'chars', 'swapCase', 'escapeHTML', 'unescapeHTML', 'escapeRegExp',
    'splice', 'insert', 'join', 'lines', 'startsWith', 'endsWith',
    'succ', 'titleize', 'camelize', 'underscored', 'dasherize',
    'classify', 'humanize', 'trim', 'ltrim', 'rtrim', 'truncate',
    'prune', 'words', 'pad', 'lpad', 'rpad', 'lrpad', 'sprintf',
    'vsprintf', 'toNumber',  'strRight', 'strRightBack', 'strLeft',
    'strLeftBack',  'slugify', 'surround', 'quote', 'repeat',
    'levenshtein', 'strip', 'lstrip', 'rstrip', 'center', 'rjust',
    'ljust'
  ]

  _object: String
  _extender: _s

module.exports = StringExtension