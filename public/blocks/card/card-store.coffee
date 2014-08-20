Fluxxor = require 'fluxxor'
actions = require './card-actions'

module.exports = Fluxxor.createStore
  initialize: ->
    @pronunciations = null
    @pronunciationsLoading = no

    @bindActions(
      actions.LOAD_PRONUNCIATIONS, @onLoadPronunciations
      actions.UNLOAD_PRONUNCIATIONS, @onUnloadPronunciations
    )

  onLoadPronunciations: ->
    @pronunciationsLoading = yes
    @emit 'change'

    setTimeout (=>
      @pronunciations = [
        {id: 0, transcription: 'meɪnˈteɪn', user: 'borbit'}
        {id: 1, transcription: 'meɪnˈteɪn', user: 'edward'}
        {id: 2, transcription: 'meɪnˈteɪn', user: 'serge'}
      ]

      @pronunciationsLoading = no
      @emit 'change'
    ), 200

  onUnloadPronunciations: ->
    @pronunciations = null
    @emit 'change'

  getState: ->
    pronunciations: @pronunciations
    pronunciationsLoading: @pronunciationsLoading