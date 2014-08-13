React = require 'react'
Fluxxor = require 'fluxxor'
ReactOutsideMixin = require '../../coffee/react-mixins/outside'
FluxChildMixin = Fluxxor.FluxChildMixin React
FluxWatchMixin = Fluxxor.StoreWatchMixin
render = require './form-word.jsx'

module.exports = React.createClass
  mixins: [
    FluxChildMixin
    FluxWatchMixin 'FormWordStore'
    ReactOutsideMixin
  ]

  getStateFromFlux: ->
    flux = @getFlux()
    flux.stores.FormWordStore.getState()

  onOutside: (e) ->
    @resetState()
    
  onSubmit: (e) ->
    flux = @getFlux()
    flux.actions.FormWordActions.lookup @refs.input.getDOMNode().value
    e.preventDefault()

  onSelect: (e) ->
    @props.onAdd
      pos: e.target.dataset.pos
      translation: e.target.innerHTML
      transcription: @state.transcription
      word: @state.word
    @reset()

  onAdd: (e) ->
    if e.keyCode is 13
      @props.onAdd
        translation: e.target.value
        word: @state.word
      @reset()

  onEscape: (e) ->
    if e.keyCode is 27
      @resetState()

  resetInput: ->
    @refs.input.getDOMNode().value = ''

  resetState: ->
    @setState
      translations: []
      transcription: null
      word: null

  reset: ->
    @resetInput()
    @resetState()

  render: ->
    render.apply @