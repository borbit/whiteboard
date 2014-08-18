React = require 'react'
Fluxxor = require 'fluxxor'
DetailsStore = require '../details/details-store'
DetailsActions = require '../details/details-actions'
render = require './card.jsx'

module.exports = React.createClass
  componentWillMount: ->
    stores = DetailsStore: new DetailsStore
    actions = DetailsActions: DetailsActions
    @detailsFlux = new Fluxxor.Flux stores, actions

  render: ->
    render.apply @