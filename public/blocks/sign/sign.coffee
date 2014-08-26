React = require 'react'
render = require './sign.jsx'

module.exports = React.createClass
  getInitialState: ->
    signup: no

  onSignUp: ->
    @setState signup: yes

  onLogIn: ->
    @setState signup: no

  render: ->
    render.apply @