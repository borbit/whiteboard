# @cjsx React.DOM
React = require 'react/addons'

module.exports = ->
  <ul className="menu nav nav-tabs">
    <li className="active"><a href="#">Vocabulary</a></li>
    <li><a href="#"><i className="fa fa-user"></i> Profile</a></li>
    <li className="menu__about"><a href="#"><i className="fa fa-info-circle"></i> About</a></li>
    <li className="menu__signout"><a href="/logout"><i className="fa fa-sign-out"></i> Sign out</a></li>
  </ul>