# @cjsx React.DOM
React = require 'react'

module.exports = ->
  unless @state.editing
    word = [@props.word, <i className="card__edit fa fa-pencil-square" onClick={@onEdit}></i>]
  else
    word = <input className="card__input" type="text" defaultValue={@props.word} onBlur={@onBlur} onKeyDown={@onKeyDown} ref="input" />

  <h2 className="card__word">{word}</h2>