# @cjsx React.DOM
React = require 'react'

module.exports = ->
  unless @state.editing
    <h2 className="card__word">
      {@props.word.word}
      <i className="card__edit fa fa-pencil-square" onClick={@onEdit}></i>
    </h2>
  else
    <h2 className="card__word">
      <input className="card__input" type="text" defaultValue={@props.word.word} onKeyDown={@onKeyDown} ref="input" />
      <i className="card__cancel fa fa-times" onClick={@onCancel}></i>
    </h2>

  