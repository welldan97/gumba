class AbstractExtension
  _methods: []
  _object: undefined
  _extender: undefined

  apply: ->
    for method in @_methods
      @_object.prototype[method] = @_setMethod method

  _setMethod: (method) ->
    extender = @_extender
    (args...) ->
      args.unshift this
      extender[method].apply extender, args

module.exports = AbstractExtension
