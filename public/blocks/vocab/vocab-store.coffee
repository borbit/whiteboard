Fluxxor = require 'fluxxor'
actions = require './vocab-actions'

module.exports = Fluxxor.createStore
  initialize: ->
    @words = [
      {_id: 1, word: 'maintain', translation: 'обслуживать', transcription: 'meɪnˈteɪn', image: '/img/pic1.jpg'}
      {_id: 2, word: 'party', translation: 'вечеринка', image: '/img/pic2.jpg'}
      {_id: 3, word: 'support', translation: 'поддерживать', transcription: 'meɪnˈteɪn', image: '/img/pic3.jpg'}
      {_id: 4, word: 'inquiry', translation: 'запрос', transcription: 'meɪnˈteɪn', image: '/img/pic4.jpg'}
      {_id: 5, word: 'direct', translation: 'направить', transcription: 'meɪnˈteɪn', image: '/img/pic5.jpg'}
      {_id: 6, word: 'download', translation: 'загрузить', transcription: 'meɪnˈteɪn', image: '/img/pic6.jpg'}
      {_id: 7, word: 'browser', transcription: 'meɪnˈteɪn', image: '/img/pic7.jpg'}
    ]
    @bindActions(
      actions.ADD_WORD, @onAddWord
      # actions.REMOVE_WORD, @onRemoveWord,
      # actions.EDIT_WORD, @onEditWord
    )

  onAddWord: (word) ->
    @words.push word
    @emit 'change'

  getState: ->
    words: @words