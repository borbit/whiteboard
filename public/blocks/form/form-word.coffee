React = require 'react/addons'
Fluxxor = require 'fluxxor'
ReactOutsideMixin = require '../../coffee/react-mixins/outside'
FluxStateMixin = require '../../coffee/react-mixins/flux_state'
FluxChildMixin = Fluxxor.FluxChildMixin React
FluxWatchMixin = Fluxxor.StoreWatchMixin
render = require './form-word.jsx'

module.exports = React.createClass
  mixins: [
    FluxChildMixin
    FluxWatchMixin 'FormWordStore'
    FluxStateMixin 'FormWordStore'
    React.addons.LinkedStateMixin
    ReactOutsideMixin
  ]

  getInitialState: ->
    value: ''

  onOutside: (e) ->
    @reset() if @state.word
    
  onSubmit: (e) ->
    flux = @getFlux()
    flux.actions.FormWordActions.lookup @state.value
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
      @reset()

  reset: ->
    flux = @getFlux()
    flux.actions.FormWordActions.reset()
    @setState value: ''

  render: ->
    render.apply @