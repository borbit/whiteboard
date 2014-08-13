# @cjsx React.DOM
React = require 'react'

module.exports = ->
  transcription = null

  if @props.word.transcription
    transcription = 
      <span className="card__transcription">
        <i className="card__play fa fa-play-circle"></i>
        [{@props.word.transcription}]
      </span>

  <figure className="card">
    <div className="card__image" style={backgroundImage: "url(#{@props.word.image})"}></div>
    <figcaption className="card__body">
      <h2 className="card__word">
        {@props.word.word}
        <i className="card__edit fa fa-edit"></i>
      </h2>
      {transcription}
      <h4 className="card__translation">
        {@props.word.translation}
        <i className="card__edit fa fa-edit"></i>
      </h4>
    </figcaption>
  </figure>

# <blockquote className="card__context">
#   <small>the need to maintain close links between industry and schools</small>
# </blockquote>
# <blockquote className="card__context">
#   <small>the need to maintain close links between industry and schools</small>
# </blockquote>