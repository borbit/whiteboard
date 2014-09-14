React = require 'react/addons'
Fluxxor = require 'fluxxor'
FluxMixin = Fluxxor.FluxMixin React
render = require './app_board.jsx'

module.exports = React.createClass
  mixins: [
    FluxMixin
  ]
  
  render: ->
    render.apply @