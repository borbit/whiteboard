# @cjsx React.DOM
React = require 'react'
Details = require '../details/details'
CardWord = require './card__word'
CardTranscription = require './card__transcription'
CardTranslation = require './card__translation'
Mem = require '../mem/mem'

module.exports = ->
  <figure className="card">
    <div className="card__image">
      <Mem image={@props.word.image} />
    </div>
    <figcaption className="card__body">
      <CardWord word={@props.word.word}/>
      <CardTranscription transcription={@props.word.transcription}/>
      <CardTranslation translation={@props.word.translation}/>
      <Details flux={@detailsFlux}/>
    </figcaption>
  </figure>