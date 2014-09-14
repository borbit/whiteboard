_ = require 'underscore'

events =
  LOOKUP: 'LOOKUP'
  RESET: 'RESET'

module.exports = _.extend events,
  lookup: (word) ->
    @dispatch events.LOOKUP, word

  reset: (word) ->
    @dispatch events.RESET, word