React = require 'react'
render = require './sign.jsx'
page = require 'page'

module.exports = React.createClass
  onSignUp: ->
    page '/signup'

  onLogIn: ->
    page '/login'

  render: ->
    render.apply @