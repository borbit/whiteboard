_ = require 'underscore'

events = 
  ADD_CARD: 'ADD_CARD'
  GET_CARD: 'GET_CARD'
  REMOVE_CARD: 'REMOVE_CARD'

module.exports = _.extend events,
  addCard: (word) ->
    @dispatch events.ADD_CARD, word

  getCard: (cardId) ->
    @dispatch events.GET_CARD, cardId

  removeCard: (cardId) ->
    @dispatch events.REMOVE_CARD, cardId