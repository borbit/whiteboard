_ = require 'underscore'

events =
  LOOKUP: 'LOOKUP'

module.exports = _.extend events,
  lookup: (word) ->
    @dispatch events.LOOKUP, word