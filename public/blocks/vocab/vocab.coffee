React = require 'react'
Fluxxor = require 'fluxxor'
FluxChildMixin = Fluxxor.FluxChildMixin React
FluxWatchMixin = Fluxxor.StoreWatchMixin
render = require './vocab.jsx'
_ = require 'underscore'

module.exports = React.createClass
  mixins: [
    FluxChildMixin
    FluxWatchMixin 'VocabStore'
  ]

  onCardClosed: ->
    @setState word: null

  onCardClick: (e) ->
    flux = @getFlux()
    flux.actions.VocabActions.getCard e.target.dataset.id

  onCardAdd: (word) ->
    flux = @getFlux()
    flux.actions.VocabActions.addCard word

  onToggle: ->
    @setState condensed: !@state.condensed

  getInitialState: ->
    condensed: yes

  getStateFromFlux: ->
    flux = @getFlux()
    flux.stores.VocabStore.getState()

  render: ->
    render.apply @