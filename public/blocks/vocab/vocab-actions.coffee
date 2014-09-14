_ = require 'underscore'

events = 
  ADD_CARD: 'ADD_CARD'
  GET_CARD: 'GET_CARD'
  SELECT_CARD: 'SELECT_CARD'
  SELECT_CARDS: 'SELECT_CARDS'
  REMOVE_CARDS: 'REMOVE_CARDS'
  LEARN_CARD: 'LEARN_CARD'

module.exports = _.extend events,
  addCard: (word) ->
    @dispatch events.ADD_CARD, word

  getCard: (cardId) ->
    @dispatch events.GET_CARD, cardId
    
  selectCard: (cardId) ->
    @dispatch events.SELECT_CARD, cardId

  selectCards: ->
    @dispatch events.SELECT_CARDS

  removeCards: ->
    @dispatch events.REMOVE_CARDS

  learnCard: (cardId) ->
    @dispatch events.LEARN_CARD, cardId
