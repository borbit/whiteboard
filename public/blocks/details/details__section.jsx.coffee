# @cjsx React.DOM
React = require 'react/addons'
DetailsForm = require './details__form'

module.exports = ->
  if @props.available?.length
    content = <DetailsForm items={@props.available}/>
    icon = <i className="details__cancel fa fa-times" onClick={@props.onCancel}></i>
  else
    content = @props.children
    if @props.loading
      icon = <i className="details__edit fa fa-circle-o-notch fa-spin"></i>
    else
      icon = <i className="details__edit fa fa-pencil-square" onClick={@props.onEdit}></i>

  <section className="details__section">
    {icon}
    <dt className="details__title">{@props.title}:</dt>
    <dd className="details__content">
      {content}
    </dd>
  </section>