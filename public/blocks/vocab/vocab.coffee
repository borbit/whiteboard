React = require 'react/addons'
Fluxxor = require 'fluxxor'
FluxStateMixin = require '../../coffee/react-mixins/flux_state'
FluxChildMixin = Fluxxor.FluxChildMixin React
FluxWatchMixin = Fluxxor.StoreWatchMixin
render = require './vocab.jsx'
_ = require 'underscore'

module.exports = React.createClass
  mixins: [
    FluxChildMixin
    FluxWatchMixin 'VocabStore'
    FluxStateMixin 'VocabStore'
  ]

  onCardClosed: ->
    @setState word: null

  onCardClick: (cardId) ->
    @getFlux().actions.VocabActions.getCard cardId

  onCardAdd: (word) ->
    @getFlux().actions.VocabActions.addCard word

  onCardSelect: (cardId) ->
    @getFlux().actions.VocabActions.selectCard cardId
  
  onCardsSelect: ->
    @getFlux().actions.VocabActions.selectCards()

  onCardsRemove: ->
    if confirm 'Are you sure?'
      @getFlux().actions.VocabActions.removeCards()

  onCardLearn: (cardId) ->
    @getFlux().actions.VocabActions.learnCard cardId

  onToggleView: ->
    @setState condensed: !@state.condensed

  getInitialState: ->
    condensed: yes

  render: ->
    render.apply @