React = require 'react/addons'
Fluxxor = require 'fluxxor'
FluxChildMixin = Fluxxor.FluxChildMixin React
FluxWatchMixin = Fluxxor.StoreWatchMixin
render = require './card__pronunciation.jsx'

module.exports = React.createClass
  mixins: [
    FluxChildMixin
    FluxWatchMixin 'CardStore'
  ]

  getInitialState: ->
    editing: no

  getStateFromFlux: ->
    @getFlux().stores.CardStore.getState()

  componentDidUpdate: ->
    if @state.editing
      input = @refs.input.getDOMNode()
      input.setSelectionRange 0, input.value.length

  onEdit: ->
    @setState editing: yes
  
  onCancel: ->
    @setState editing: no
    @hidePronunciations() if @state.pronunciations

  showPronunciations: ->
    @getFlux().actions.CardActions.loadPronunciations()

  hidePronunciations: ->
    @getFlux().actions.CardActions.unloadPronunciations()

  render: ->
    render.apply @