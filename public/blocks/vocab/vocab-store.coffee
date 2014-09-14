_ = require 'underscore'
Fluxxor = require 'fluxxor'
actions = require './vocab-actions'
Card = require '../../coffee/models/card'

module.exports = Fluxxor.createStore
  initialize: (@cards = []) ->
    @card = null
    @selectedAll = no
    @selectedAny = no
    @bindActions(
      actions.ADD_CARD, @onAddCard
      actions.GET_CARD, @onGetCard
      actions.SELECT_CARD, @onSelectCard
      actions.SELECT_CARDS, @onSelectCards
      actions.REMOVE_CARDS, @onRemoveCards
      actions.LEARN_CARD, @onLearnCard
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

  onSelectCards: ->
    @selectedAll = not @selectedAll
    @selectedAny = @selectedAll
    @cards.forEach (card) =>
      card.selected = @selectedAll
    @emit 'change'

  onSelectCard: (cardId) ->
    @selectedAll = no
    @cards.forEach (card) ->
      if card._id == cardId
        card.selected = not card.selected
    @selectedAny = @cards.some (card) ->
      card.selected
    @emit 'change'

  onRemoveCards: ->
    cards = @cards.filter (card) ->
      card.selected
    done = _.after cards.length, =>
      @selectedAll = no
      @selectedAny = no
      @cards = @cards.filter (card) ->
        not card.selected
      @emit 'change'
    cards.forEach (card) ->
      card = new Card card
      card.destroy success: done

  onLearnCard: (cardId) ->
    card = _.find @cards, (card) ->
      card._id == cardId

    model = new Card card
    model.set 'learned', yes
    model.save success: ->
      card.learned = yes
      @emit 'change'

  getState: ->
    selectedAll: @selectedAll
    selectedAny: @selectedAny
    cards: @cards
    card: @card