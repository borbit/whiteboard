# @cjsx React.DOM
React = require 'react/addons'
cs = React.addons.classSet

module.exports = ->
  
  classes = cs
    'board__text': yes
    'board__text_dragging': @state.dragging
    'board__text_editing': @state.editing
    'board__text_hover': @state.hover

  <div className={classes} style={left: @props.x, top: @props.y} onMouseOver={@onMouseOver} onMouseOut={@onMouseOut}>
    <div className="board__btns">
      <b className="board__btn"><i className="fa fa-remove"></i></b>
    </div>
    <p contentEditable={@state.edititng} onClick={@onClick} ref="text">{@props.children}</p>
  </div>