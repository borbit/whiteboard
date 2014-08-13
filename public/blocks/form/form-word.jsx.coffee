# @cjsx React.DOM
React = require 'react'

module.exports = ->
  if @state.translations
    if @state.translations.length
      translations = @state.translations.map (i) =>
        <li className={i.pos}><a onClick={@onSelect} data-pos={i.pos}>{i.text}</a></li>
    else
      translations = <li><i className="form-word__no">No translations found</i></li>

    translations =
      <ul className="form-word__list dropdown-menu">
        {translations}
        <li className="divider"></li>
        <li><input className="form-word__your" placeholder="Your translation" onKeyDown={@onAdd}/></li>
      </ul>
  else
    translations = null

  icon = <i className="fa fa-circle-o-notch fa-spin"></i>
  icon = <i className="fa fa-search"></i> unless @state.loading

  <form className="form-word dropdown open" onSubmit={@onSubmit}>
    <div className="input-group">
      <input className="form-control" placeholder="Add a word" onKeyDown={@onEscape} ref="input" />
      <div className="input-group-btn">
        <button className="form-word__search btn btn-default">{icon}</button>
      </div>
    </div>
    {translations}
  </form>