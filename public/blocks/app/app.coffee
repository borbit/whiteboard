React = require 'react'
Fluxxor = require 'fluxxor'
FluxMixin = Fluxxor.FluxMixin React
render = require './app.jsx'

module.exports = React.createClass
  mixins: [
    FluxMixin
  ]

  render: ->
    render.apply @