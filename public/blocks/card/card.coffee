React = require 'react/addons'
Fluxxor = require 'fluxxor'
FluxChildMixin = Fluxxor.FluxChildMixin React
FluxWatchMixin = Fluxxor.StoreWatchMixin
render = require './card.jsx'

module.exports = React.createClass
  mixins: [
    FluxChildMixin
  ]

  propsTypes:
    mem: React.PropTypes.object
    word: React.PropTypes.object
    transcription: React.PropTypes.string
    translation: React.PropTypes.string
    definitions: React.PropTypes.array
    examples: React.PropTypes.array
    forms: React.PropTypes.array

  render: ->
    render.apply @