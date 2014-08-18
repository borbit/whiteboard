# @cjsx React.DOM
React = require 'react'

module.exports = ->
  <p>{(@props.items.map (i) -> i.text).join ', '}</p>