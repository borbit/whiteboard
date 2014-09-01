Fluxxor = require 'fluxxor'
actions = require './vocab-actions'
Card = require '../../coffee/models/card'

module.exports = Fluxxor.createStore
  initialize: (@cards) ->
    @card = null
    @bindActions(
      actions.ADD_CARD, @onAddCard
      actions.GET_CARD, @onGetCard
    )

  onAddCard: (word) ->
    card = new Card word
    card.save null, success: (card) =>
      @cards.push card.toJSON()
      @emit 'change'

  onGetCard: (cardId) ->
    card = new Card id: cardId
    card.fetch success: (card) =>
      @card = card.toJSON()
      @emit 'change'

  getState: ->
    cards: @cards
    card: @card