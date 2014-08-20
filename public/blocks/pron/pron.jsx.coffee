# @cjsx React.DOM
React = require 'react'

module.exports = ->
  <span className="pron">
    <i className="pron__sound fa fa-play-circle"></i>
    <span className="pron__transcription">
      [{@props.transcription}]
    </span>
  </span>