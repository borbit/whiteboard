_ = require 'underscore'

events =
  LOAD_PRONUNCIATIONS: 'LOAD_PRONUNCIATIONS'
  UNLOAD_PRONUNCIATIONS: 'UNLOAD_PRONUNCIATIONS'

module.exports = _.extend events,
  loadPronunciations: ->
    @dispatch events.LOAD_PRONUNCIATIONS

  unloadPronunciations: ->
    @dispatch events.UNLOAD_PRONUNCIATIONS