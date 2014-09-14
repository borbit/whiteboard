$ = require 'jquery'
React = require 'react/addons'
render = require './board__sheet.jsx'

module.exports = React.createClass
  getInitialState: ->
    items: []

  onDoubleClick: (e) ->
    $sheet = $ e.currentTarget

    offset = $sheet.offset()
    clickX = ~~(e.pageX - offset.left)
    clickY = ~~(e.pageY - offset.top)

    @state.items.push {
      type: 'text'
      value: 'asd'
      x: clickX
      y: clickY
    }

    @setState items: @state.items

  render: ->
    render.apply @