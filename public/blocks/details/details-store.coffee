Fluxxor = require 'fluxxor'
actions = require './details-actions'

module.exports = Fluxxor.createStore
  initialize: ->
    @definitions = null
    @relatedForms = null
    @examples = null

    @definitionsLoading = no
    @relatedFormsLoading = no
    @examplesLoading = no

    @bindActions(
      actions.LOAD_DEFINITIONS, @onLoadDefinitions
      actions.LOAD_RELATED_FORMS, @onLoadRelatedForms
      actions.LOAD_EXAMPLES, @onLoadExamples
      actions.UNLOAD_DEFINITIONS, @onUnloadDefinitions
      actions.UNLOAD_RELATED_FORMS, @onUnloadRelatedForms
      actions.UNLOAD_EXAMPLES, @onUnloadExamples
    )

  onLoadDefinitions: ->
    @definitionsLoading = yes
    @emit 'change'

    setTimeout (=>
      @definitions = [
        {id: 0, text: 'to keep in existence or continuance; preserve; retain'}
        {id: 0, text: 'to keep in an appropriate condition, operation, or force; keep unimpaired to keep in an appropriate condition, operation, or force; keep unimpaired'}
        {id: 0, text: 'to keep in a specified state, position, etc.'}
        {id: 0, text: 'to affirm; assert; declare'}
        {id: 0, text: 'to keep in existence or continuance; preserve; retain'}
        {id: 0, text: 'to keep in an appropriate condition, operation, or force; keep unimpaired to keep in an appropriate condition, operation, or force; keep unimpaired'}
        {id: 0, text: 'to keep in a specified state, position, etc.'}
        {id: 0, text: 'to affirm; assert; declare'}
      ]

      @definitionsLoading = no
      @emit 'change'
    ), 200

  onUnloadDefinitions: ->
    @definitions = null
    @emit 'change'

  onLoadExamples: ->
    @examplesLoading = yes
    @emit 'change'

    setTimeout (=>
      @examples = [
        {id: 0, text: 'to keep in existence or continuance; preserve; retain'}
        {id: 0, text: 'to keep in an appropriate condition, operation, or force; keep unimpaired to keep in an appropriate condition, operation, or force; keep unimpaired'}
        {id: 0, text: 'to keep in a specified state, position, etc.'}
        {id: 0, text: 'to affirm; assert; declare'}
        {id: 0, text: 'to keep in existence or continuance; preserve; retain'}
        {id: 0, text: 'to keep in an appropriate condition, operation, or force; keep unimpaired to keep in an appropriate condition, operation, or force; keep unimpaired'}
        {id: 0, text: 'to keep in a specified state, position, etc.'}
        {id: 0, text: 'to affirm; assert; declare'}
      ]

      @examplesLoading = no
      @emit 'change'
    ), 200

  onUnloadExamples: ->
    @examples = null
    @emit 'change'

  onLoadRelatedForms: ->
    @relatedFormsLoading = yes
    @emit 'change'

    setTimeout (=>
      @relatedForms = [
        {id: 0, text: 'to keep in existence or continuance; preserve; retain'}
        {id: 0, text: 'to keep in an appropriate condition, operation, or force; keep unimpaired to keep in an appropriate condition, operation, or force; keep unimpaired'}
        {id: 0, text: 'to keep in a specified state, position, etc.'}
        {id: 0, text: 'to affirm; assert; declare'}
        {id: 0, text: 'to keep in existence or continuance; preserve; retain'}
        {id: 0, text: 'to keep in an appropriate condition, operation, or force; keep unimpaired to keep in an appropriate condition, operation, or force; keep unimpaired'}
        {id: 0, text: 'to keep in a specified state, position, etc.'}
        {id: 0, text: 'to affirm; assert; declare'}
      ]

      @relatedFormsLoading = no
      @emit 'change'
    ), 200

  onUnloadRelatedForms: ->
    @relatedForms = null
    @emit 'change'

  getState: ->
    definitions: @definitions
    definitionsLoading: @definitionsLoading
    relatedFormsLoading: @relatedFormsLoading
    examplesLoading: @examplesLoading
    relatedForms: @relatedForms
    examples: @examples
