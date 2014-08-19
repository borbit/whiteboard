React = require 'react'
render = require './details__form.jsx'

module.exports = React.createClass
  getInitialState: ->
    formOpened: no

  componentDidUpdate: ->
    @refs.text.getDOMNode().focus() if @state.formOpened

  onOpenForm: ->
    @setState formOpened: yes

  onCloseForm: ->
    @refs.text.getDOMNode().value = ''
    @setState formOpened: no

  onSubmit: (e) ->
    e.preventDefault()

  render: ->
    render.apply @