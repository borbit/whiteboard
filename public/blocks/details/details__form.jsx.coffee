# @cjsx React.DOM
React = require 'react'

module.exports = ->
  unless @state.formOpened 
    form = [
      <button className="details__btn-save btn btn-default btn-sm" onClick={@onSave}>
        <i className="fa fa-check"></i> Save
      </button>,
      <button className="details__btn-add btn btn-default btn-sm" onClick={@onOpenForm}>
        <i className="fa fa-plus"></i> Add new
      </button>]
  else
    form =
      <form onSubmit={@onSubmit}>
        <textarea className="details__textarea form-control" rows="3" ref="text"></textarea>
        <button className="details__btn-add btn btn-default btn-sm">
          <i className="fa fa-check"></i> Add
        </button> 
        <span className="details__btn-close btn btn-default btn-sm" onClick={@onCloseForm}>
          <i className="fa fa-times"></i> Cancel
        </span>
      </form>

  items = @props.items.map (item) ->
    <tr>
      <td><input type="checkbox"/></td>
      <td>{item.text}</td>
      <td>@borbit</td>
    </tr>

  <div className="details__form clearfix">
    <table className="table table-condensed">{items}</table>
    {form}
  </div>