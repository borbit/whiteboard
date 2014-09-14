# @cjsx React.DOM
React = require 'react/addons'

module.exports = ->
  <p>{(@props.items.map (i) -> i.text).join ', '}</p>