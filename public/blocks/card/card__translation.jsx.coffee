# @cjsx React.DOM
React = require 'react'

module.exports = ->
  unless @state.editing
    <h4 className="card__translation">
      {@props.translation}
      <i className="card__edit fa fa-pencil-square" onClick={@onEdit}></i>
    </h4>
  else
    <h4 className="card__translation">
      <input className="card__input" defaultValue={@props.translation} onKeyDown={@onKeyDown} ref="input" />
      <i className="card__cancel fa fa-times" onClick={@onCancel}></i>
    </h4>

  