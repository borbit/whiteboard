# @cjsx React.DOM
React = require 'react'

module.exports = ->
  if @state.translations.length
    translations = @state.translations.map (i) =>
      <li className={i.pos}>
        <a onClick={@onSelect} data-pos={i.pos}>{i.text}</a>
      </li>
    translations =
      <ul className="form-word__list dropdown-menu">
        {translations}
        <li className="divider"></li>
        <li><input className="form-word__your" placeholder="Your translation" onKeyDown={@onAdd}/></li>
      </ul>
  else
    translations = null

  if @state.loading
    icon = <i className="fa fa-circle-o-notch fa-spin"></i>
  else
    icon = <i className="fa fa-search"></i>

  <form className="form-word dropdown open" onSubmit={@onSubmit}>
    <div className="input-group">
      <input className="form-control" placeholder="Add a word" onKeyDown={@onEscape} ref="input" />
      <div className="input-group-btn">
        <button className="btn btn-default">{icon}</button>
      </div>
    </div>
    {translations}
  </form>