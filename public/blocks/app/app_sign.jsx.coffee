# @cjsx React.DOM
React = require 'react'
Sign = require '../../blocks/sign/sign'

module.exports = ->
  <div className="app app_sign">
    <div className="app__page">
      <Sign
        view={@props.page}
        errors={@props.errors}
        values={@props.values}
      />
    </div>
  </div>