# @cjsx React.DOM
React = require 'react'
FormWord = require '../form/form-word'
Modal = require '../modal/modal'
Card = require '../card/card'
cs = React.addons.classSet

CardStore = require '../card/card-store'
CardActions = require '../card/card-actions'

module.exports = ->
  if @state.word
    stores = CardStore: new CardStore
    actions = CardActions: CardActions
    
    cardFlux = new Fluxxor.Flux stores, actions
    card = <Card flux={cardFlux} word={@state.word}/>

    modal = <Modal content={card} onClosed={@onCardClosed} />

  words = @state.words.map (word) =>
    <tr>
      <td width="40"><input type="checkbox"/></td>
      <td onClick={@onWordClick} data-id={word._id}>
        <i className="vocab__play fa fa-play-circle"></i> 
        <span className="vocab__word">{word.word}</span> — 
        <span className="vocab__translation">{word.translation}</span>
      </td>
    </tr>

  listTableClass = cs
    'table': yes
    'table-condensed': @state.condensed
    'vocab__list': yes

  toggleIconClass = cs
    'fa': yes
    'fa-align-justify': @state.condensed
    'fa-bars': !@state.condensed

  <div className="vocab">
    {modal}
    <table className="vocab__head table">
      <thead>
        <tr>
          <td width="40"><input type="checkbox"/></td>
          <td width="250"><FormWord onAdd={@onWordAdd}/></td>
          <td>
            <div className="btn-group vocab__filters">
              <button className="vocab__filter btn btn-default active">All</button>
              <button className="vocab__filter btn btn-default">Words</button>
              <button className="vocab__filter btn btn-default">Phrases</button>
            </div>
            <button className="btn btn-default" onClick={@onToggle}>
              <i className={toggleIconClass}></i>
            </button>
          </td>
        </tr>
      </thead>
    </table>
    <table className={listTableClass}>
      <tbody>
        {words}
      </tbody>
    </table>
  </div>