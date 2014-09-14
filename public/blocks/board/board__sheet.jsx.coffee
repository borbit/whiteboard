# @cjsx React.DOM
React = require 'react/addons'
BoardText = require './board__text'

module.exports = ->
  items = @state.items.map (item, index) =>
    if item.type == 'text' and index != @state.input
      <BoardText x={item.x} y={item.y} index={index} onClick={@onTextClick}>{item.value}</BoardText>

  <div className="board__sheet" onDoubleClick={@onDoubleClick}>
    {items}
  </div>