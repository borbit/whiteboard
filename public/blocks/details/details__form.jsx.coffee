# @cjsx React.DOM
React = require 'react'

module.exports = ->
  items = @props.items.map (item) ->
    <li className="details__item checkbox">
      <label><input type="checkbox"/>{item.text}</label>
    </li>
  <div className="details__form">
    <ul className="details__list list-unstyled">{items}</ul>
    <button className="btn btn-default btn-sm">
      <i className="fa fa-plus"></i> Add
    </button>
  </div>