React = require 'react/addons'
render = require './app_sign.jsx'

module.exports = React.createClass
  propTypes:
    page   : React.PropTypes.string
    values : React.PropTypes.object
    errors : React.PropTypes.array

  render: ->
    render.apply @