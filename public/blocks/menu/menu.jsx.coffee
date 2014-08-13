# @cjsx React.DOM
React = require 'react'

module.exports = ->
  <ul className="menu nav nav-tabs">
    <li className="active"><a href="#">Vocabulary</a></li>
    <li><a href="#">Whiteboards</a></li>
    <li><a href="#">Profile</a></li>
    <li className="menu__about"><a href="#"><i className="fa fa-info-circle"></i> About</a></li>
    <li className="menu__signout"><a href="#"><i className="fa fa-sign-out"></i> Sign out</a></li>
  </ul>