# @cjsx React.DOM
React = require 'react'

module.exports = ->
  <figure className="card">
    <div className="card__image" style={backgroundImage: "url(#{@props.word.image})"}></div>
    <figcaption className="card__body">
      <h3 className="card__word">{@props.word.word}<i className="card__edit fa fa-edit"></i></h3>
      <h4 className="card__translation">{@props.word.translation}<i className="card__edit fa fa-edit"></i></h4>
      <blockquote className="card__context">
        <small>
          <b>Super Mario</b> Bros, the successor to the 1983 arcade title Mario Bros., was designed by
          Shigeru Miyamoto and Takashi Tezuka, both of whom belonged to Nintendo's former Creative
          Department at the time.
        </small>
      </blockquote>
    </figcaption>
  </figure>