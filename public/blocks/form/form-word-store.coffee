Fluxxor = require 'fluxxor'
actions = require './form-word-actions'
config = require '../../coffee/config'
_ = require 'underscore'
$ = require 'jquery'

module.exports = Fluxxor.createStore
  initialize: ->
    @reset()
    @bindActions(
      actions.LOOKUP, @onLookup
      actions.RESET, @onReset
    )

  reset: ->
    @loading = no
    @translations = null
    @transcription = null
    @word = null

  onLookup: (word) ->
    return if @loading

    @loading = yes
    @translations = null
    @transcription = null
    @word = word.trim()
    @emit 'change'
    
    if ' ' in @word
      data = 
        key: config.YANDEX_TRANSLATE_KEY
        lang: 'en-ru'
        text: @word

      promise = $.ajax
        url: config.YANDEX_TRANSLATE_URL
        data: data
      
      @translations = []
      promise.done (res) =>
        @translations.push text: res.text
        @loading = no
        @emit 'change'
        
    else
      data = 
        key: config.YANDEX_DICTIONARY_KEY
        lang: 'en-ru'
        text: @word

      promise = $.ajax
        url: config.YANDEX_DICTIONARY_URL
        data: data
      
      promise.done (res) =>
        @translations = []
        _.each res.def, (def) =>
          @transcription = def.ts
          _.each def.tr, (item) =>
            @translations.push
              text: item.text
              pos: def.pos

        @loading = no
        @emit 'change'

  onReset: ->
    @reset()
    @emit 'change'

  getState: ->
    translations: @translations
    transcription: @transcription
    loading: @loading
    word: @word
