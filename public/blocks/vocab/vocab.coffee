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

  onWordClick: (e) ->
    wordId = +e.target.dataset.id
    wordData = _.find @state.words, (word) ->
      word._id == wordId
    @setState word: wordData

  onWordAdd: (word) ->
    flux = @getFlux()
    flux.actions.VocabActions.addWord word

  onToggle: ->
    @setState condensed: !@state.condensed

  getInitialState: ->
    condensed: no

  getStateFromFlux: ->
    flux = @getFlux()
    flux.stores.VocabStore.getState()

  render: ->
    render.apply @