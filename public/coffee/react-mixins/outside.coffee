$ = require 'jquery'

module.exports =
  componentWillMount: ->
    @detect = @detect.bind @
    
  componentDidMount: ->
    $('body').on 'click', @detect

  componentDidUnmount: ->
    $('body').off 'click', @detect

  detect: (e) ->
    $el = $ @getDOMNode()
    if (not $el.is(e.target) and
        not $el.has(e.target).length)
      @onOutside()