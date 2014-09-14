Fluxxor = require 'fluxxor'
actions = require './board-actions'

module.exports = Fluxxor.createStore
  initialize: ->
    @sheets = [
      [{type: 'text', value: '1', x: 200, y: 200}]
      [{type: 'text', value: '2', x: 200, y: 200}]
    ]

  getState: ->
    sheets: @sheets