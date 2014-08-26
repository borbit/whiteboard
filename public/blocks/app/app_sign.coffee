page = require 'page'
React = require 'react'
Fluxxor = require 'fluxxor'
FluxMixin = Fluxxor.FluxMixin React
render = require './app_sign.jsx'

module.exports = React.createClass
  mixins: [
    FluxMixin
  ]

  getInitialState: ->
    page: 'login'

  componentWillMount: ->
    page '/signup', =>
      @setState page: 'signup'
    page '/login', =>
      @setState page: 'login'
    page()

  render: ->
    render.apply @