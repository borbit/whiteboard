React = require 'react'
render = require './sign.jsx'

module.exports = React.createClass
  propTypes:
    page   : React.PropTypes.string
    values : React.PropTypes.object
    errors : React.PropTypes.array

  checkPasswords: (e) ->
    passwd = @refs.passwd.getDOMNode()
    repeat = @refs.repeat.getDOMNode()

    if passwd.value != repeat.value
      repeat.setCustomValidity 'The two passwords must match.'
    else
      repeat.setCustomValidity ''
    
  render: ->
    render.apply @