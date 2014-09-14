# @cjsx React.DOM
React = require 'react/addons'

module.exports = ->
  <ul className="menu nav nav-tabs">
    <li className="menu__about"><a href="#"><i className="fa fa-info-circle"></i> About</a></li>
    <li className="menu__signout active"><a href="#"><i className="fa fa-sign-out"></i> Sign in</a></li>
  </ul>