# @cjsx React.DOM
React = require 'react'
DetailsForm = require './details__form'

module.exports = ->
  if @props.available?.length
    content = <DetailsForm items={@props.available}/>
    icons = [
      <i className="details__save fa fa-check-square" onClick={@props.onSave}></i>
      <i className="details__cancel fa fa-times" onClick={@props.onCancel}></i>
    ]
  else
    content = @props.children
    if @props.loading
      icons = <i className="details__edit fa fa-circle-o-notch fa-spin"></i>
    else
      icons = <i className="details__edit fa fa-pencil-square" onClick={@props.onEdit}></i>

  <section className="details__section">
    {icons}
    <dt className="details__title">{@props.title}:</dt>
    <dd className="details__content">
      {content}
    </dd>
  </section>