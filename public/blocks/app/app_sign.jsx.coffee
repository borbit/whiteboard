# @cjsx React.DOM
React = require 'react'
Sign = require '../../blocks/sign/sign'
MenuSign = require '../../blocks/menu/menu_sign'

module.exports = ->
  <div className="app app_sign">
    <div className="app__page"><Sign view={@state.page}/></div>
  </div>