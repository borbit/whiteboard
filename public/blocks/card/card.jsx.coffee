# @cjsx React.DOM
React = require 'react/addons'
Details = require '../details/details'
CardWord = require './card__word'
CardPronunciation = require './card__pronunciation'
CardTranslation = require './card__translation'
Mem = require '../mem/mem'

module.exports = ->
  <figure className="card">
    <div className="card__image">
      <Mem image={@props.mem} />
    </div>
    <figcaption className="card__body">
      <CardWord word={@props.word}/>
      <CardPronunciation transcription={@props.transcription}/>
      <CardTranslation translation={@props.translation}/>
      <Details
        definitions={@props.definitions}
        examples={@props.examples}
        forms={@props.forms}
      />
    </figcaption>
  </figure>