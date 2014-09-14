# @cjsx React.DOM
React = require 'react/addons'

module.exports = ->
  items = @props.items.map (item) ->
    <li className="details__item">— {item.text}</li>
  <ul className="details__list list-unstyled">
    {items}
  </ul>