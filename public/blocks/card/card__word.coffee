React = require 'react'
render = require './card__word.jsx'

module.exports = React.createClass
  getInitialState: ->
    editing: no

  componentDidUpdate: ->
    if @state.editing
      input = @refs.input.getDOMNode()
      input.setSelectionRange 0, input.value.length

  onEdit: ->
    @setState editing: yes

  onBlur: ->
    @setState editing: no

  onKeyDown: (e) ->   
    if e.keyCode is 13
      @props.onChange @refs.input.getDOMNode().value
    if e.keyCode is 27
      @onBlur()

  render: ->
    render.apply @