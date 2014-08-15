$ = require 'jquery'
React = require 'react'
render = require './mem.jsx'

module.exports = React.createClass
  componentDidMount: ->
    $(@refs.carousel.getDOMNode()).carousel
      interval: no

  render: ->
    render.apply @