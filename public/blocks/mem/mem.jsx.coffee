# @cjsx React.DOM
React = require 'react/addons'

module.exports = ->
  <div className="mem">
    <i className="mem__edit fa fa-pencil-square"></i>
    <div id="mem_carousel" className="carousel slide" ref="carousel">
      <ol className="carousel-indicators">
        <li data-target="#mem_carousel" data-slide-to="0" className="active"></li>
        <li data-target="#mem_carousel" data-slide-to="1"></li>
        <li data-target="#mem_carousel" data-slide-to="2"></li>
      </ol>
      <div className="carousel-inner">
        <div className="item active"><img src={@props.image}/></div>
        <div className="item"><img src={@props.image}/></div>
        <div className="item"><img src={@props.image}/></div>
      </div>
    </div>
  </div>