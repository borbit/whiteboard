# @cjsx React.DOM
React = require 'react'
Details = require '../details/details'
CardWord = require './card__word'
CardTranslation = require './card__translation'
Mem = require '../mem/mem'

module.exports = ->
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
      <CardWord word={@props.word.word}/>
      {transcription}
      <CardTranslation translation={@props.word.translation}/>
      <Details flux={@detailsFlux}/>
    </figcaption>
  </figure>