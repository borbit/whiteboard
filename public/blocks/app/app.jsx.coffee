# @cjsx React.DOM
React = require 'react'
Vocab = require '../../blocks/vocab/vocab'
Menu = require '../../blocks/menu/menu'

module.exports = ->
  <div className="app app_vocab">
    <div className="app__menu"><Menu/></div>
    <div className="app__page"><Vocab/></div>
  </div>