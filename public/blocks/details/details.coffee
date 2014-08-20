React = require 'react'
Fluxxor = require 'fluxxor'
FluxChildMixin = Fluxxor.FluxChildMixin React
FluxWatchMixin = Fluxxor.StoreWatchMixin
render = require './details.jsx'

module.exports = React.createClass
  mixins: [
    FluxChildMixin
    FluxWatchMixin 'DetailsStore'
  ]

  getStateFromFlux: ->
    @getFlux().stores.DetailsStore.getState()

  editDefinitions: ->
    @getFlux().actions.DetailsActions.loadDefinitions()
  unloadDefinitions: ->
    @getFlux().actions.DetailsActions.unloadDefinitions()

  editRelatedForms: ->
    @getFlux().actions.DetailsActions.loadRelatedForms()
  unloadRelatedForms: ->
    @getFlux().actions.DetailsActions.unloadRelatedForms()

  editExamples: ->
    @getFlux().actions.DetailsActions.loadExamples()
  unloadExamples: ->
    @getFlux().actions.DetailsActions.unloadExamples()

  render: ->
    render.apply @