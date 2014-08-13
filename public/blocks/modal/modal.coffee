$ = require 'jquery'
React = require 'react'
render = require './modal.jsx'

module.exports = React.createClass
  componentDidMount: ->
    @$modal = $(@getDOMNode()).modal()
    
    if @props.onOpen
      @$modal.on 'show.bs.modal', @props.onOpen
    if @props.onOpened
      @$modal.on 'shown.bs.modal', @props.onOpened
    if @props.onClose
      @$modal.on 'hide.bs.modal', @props.onClose
    if @props.onClosed
      @$modal.on 'hidden.bs.modal', @props.onClosed

  componentWillUnmount: ->
    @$modal.off()

  render: ->
    render.apply @