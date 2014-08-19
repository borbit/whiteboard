# @cjsx React.DOM
React = require 'react'

module.exports = ->
  unless @state.formOpened 
    form =
      <button className="btn btn-default btn-sm" onClick={@onOpenForm}>
        <i className="fa fa-plus"></i> Add
      </button>
  else
    form =
      <form onSubmit={@onSubmit}>
        <textarea className="details__textarea form-control" rows="3" ref="text"></textarea>
        <button className="details__btn-add btn btn-primary btn-sm">
          <i className="fa fa-check"></i> Add
        </button> 
        <span className="details__btn-close btn btn-default btn-sm" onClick={@onCloseForm}>
          <i className="fa fa-times"></i>
        </span>
      </form>

  items = @props.items.map (item) ->
    <li className="details__item checkbox">
      <label><input type="checkbox"/>{item.text}</label>
    </li>

  <div className="details__form clearfix">
    <ul className="details__list list-unstyled">{items}</ul>
    {form}
  </div>