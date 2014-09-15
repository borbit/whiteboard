_ = require 'underscore'

events = 
  ADD_WORD: 'ADD_WORD'
  EDIT_WORD: 'EDIT_WORD'
  REMOVE_WORD: 'REMOVE_WORD'

module.exports = _.extend events,
  addWord: (word) ->
    @dispatch events.ADD_WORD, word

  editWord: (word) ->
    @dispatch events.EDIT_WORD, word

  removeWord: (word) ->
    @dispatch events.REMOVE_WORD, word