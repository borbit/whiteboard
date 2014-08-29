React = require 'react'
render = require './sign.jsx'
page = require 'page'

module.exports = React.createClass
  onSignUp: ->
    console.log 2
    page '/signup'

  onLogIn: ->
    console.log 1
    page '/login'

  render: ->
    render.apply @