# @cjsx React.DOM
React = require 'react'
Details = require '../details/details'
Mem = require '../mem/mem'

module.exports = ->
  transcription = null

  if @props.word.transcription
    transcription = 
      <span className="card__transcription">
        <i className="card__play fa fa-play-circle"></i>
        [{@props.word.transcription}]
        <i className="card__edit fa fa-pencil-square"></i>
      </span>

  <figure className="card">
    <div className="card__image">
      <Mem image={@props.word.image} />
    </div>
    <figcaption className="card__body">
      <h2 className="card__word">
        {@props.word.word}
        <i className="card__edit fa fa-pencil-square"></i>
      </h2>
      {transcription}
      <h4 className="card__translation">
        {@props.word.translation}
        <i className="card__edit fa fa-pencil-square"></i>
      </h4>
      <Details/>
    </figcaption>
  </figure>