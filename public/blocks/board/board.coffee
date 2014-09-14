$ = require 'jquery'
React = require 'react/addons'
Fluxxor = require 'fluxxor'
FluxChildMixin = Fluxxor.FluxChildMixin React
FluxWatchMixin = Fluxxor.StoreWatchMixin
render = require './board.jsx'

module.exports = React.createClass
  mixins: [
    FluxChildMixin
    FluxWatchMixin 'BoardStore'
  ]

  getInitialState: ->
    currentSheet: 0

  getStateFromFlux: ->
    @getFlux().stores.BoardStore.getState()

  render: ->
    render.apply @