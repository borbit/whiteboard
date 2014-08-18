_ = require 'underscore'

events =
  LOAD_DEFINITIONS: 'LOAD_DEFINITIONS'
  LOAD_RELATED_FORMS: 'LOAD_RELATED_FORMS'
  LOAD_EXAMPLES: 'LOAD_EXAMPLES'
  UNLOAD_DEFINITIONS: 'UNLOAD_DEFINITIONS'
  UNLOAD_RELATED_FORMS: 'UNLOAD_RELATED_FORMS'
  UNLOAD_EXAMPLES: 'UNLOAD_EXAMPLES'

module.exports = _.extend events,
  loadDefinitions: (word) ->
    @dispatch events.LOAD_DEFINITIONS, word

  unloadDefinitions: ->
    @dispatch events.UNLOAD_DEFINITIONS

  loadRelatedForms: (word) ->
    @dispatch events.LOAD_RELATED_FORMS, word

  unloadRelatedForms: ->
    @dispatch events.UNLOAD_RELATED_FORMS

  loadExamples: (word) ->
    @dispatch events.LOAD_EXAMPLES, word

  unloadExamples: ->
    @dispatch events.UNLOAD_EXAMPLES