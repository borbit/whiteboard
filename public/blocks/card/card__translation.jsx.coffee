# @cjsx React.DOM
React = require 'react'

module.exports = ->
  translation = @props.translation
  translation ?= <i className="text-muted">no translation</i>

  unless @state.editing
    translation = [translation, <i className="card__edit fa fa-pencil-square" onClick={@onEdit}></i>]
  else
    translation = <input className="card__input" defaultValue={@props.translation} onBlur={@onBlur} onKeyDown={@onKeyDown} ref="input" />

  <h4 className="card__translation">{translation}</h4>