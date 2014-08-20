React = require 'react'
render = require './card__transcription.jsx'

module.exports = React.createClass
  getInitialState: ->
    editing: no

  onEdit: ->
    @setState editing: yes

  onClose: ->
    @setState editing: no

  render: ->
    render.apply @