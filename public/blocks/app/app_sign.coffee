React = require 'react'
render = require './app_sign.jsx'

module.exports = React.createClass
  propTypes:
    errors: React.PropTypes.array
    page: React.PropTypes.string

  render: ->
    render.apply @