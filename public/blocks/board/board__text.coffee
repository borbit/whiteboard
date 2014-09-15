React = require 'react/addons'
Draggabilly = require 'draggabilly'
render = require './board__text.jsx'

module.exports = React.createClass
  getInitialState: ->
    dragging: no
    editing: no
    hover: no

  componentDidMount: ->
    draggie = new Draggabilly @getDOMNode()
    draggie.on 'dragStart', =>
      @setState dragging: yes
    draggie.on 'dragEnd', =>
      @setState dragging: no

  componentDidUpdate: ->
    if @state.edititng
      @refs.text.getDOMNode().focus()

  onClick: ->
    @setState edititng: yes

  onBlur: ->
    @setState edititng: no

  onMouseOver: ->
    @setState hover: yes

  onMouseOut: ->
    @setState hover: no

  render: ->
    render.apply @