React = require 'react'
Fluxxor = require 'fluxxor'
FluxChildMixin = Fluxxor.FluxChildMixin React
FluxWatchMixin = Fluxxor.StoreWatchMixin
render = require './card.jsx'

module.exports = React.createClass
  mixins: [
    FluxChildMixin
  ]

  render: ->
    render.apply @