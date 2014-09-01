# @cjsx React.DOM
React = require 'react'
FormWord = require '../form/form-word'
Modal = require '../modal/modal'
Card = require '../card/card'
cs = React.addons.classSet

module.exports = ->
  if @state.card
    card = <Card
      word={@state.card.word}
      transcription={@state.card.transcription}
      translation={@state.card.translation}
      definitions={@state.card.definitions}
      examples={@state.card.examples}
      forms={@state.card.forms}
      mem={@state.card.mem}
    />
    modal = <Modal content={card} onClosed={@onCardClosed} />

  cards = @state.cards.map (card) =>
    <tr>
      <td width="40"><input type="checkbox"/></td>
      <td onClick={@onCardClick} data-id={card._id}>
        <i className="vocab__play fa fa-play-circle"></i> 
        <span className="vocab__word">{card.word.word}</span> — 
        <span className="vocab__translation">{card.translation}</span>
      </td>
    </tr>

  listTableClass = cs
    'table': yes
    'table-condensed': @state.condensed
    'vocab__list': yes

  toggleIconClass = cs
    'fa': yes
    'fa-align-justify': !@state.condensed
    'fa-bars': @state.condensed

  <div className="vocab">
    {modal}
    <table className="vocab__head table">
      <thead>
        <tr>
          <td width="40"><input type="checkbox"/></td>
          <td width="250"><FormWord onAdd={@onCardAdd}/></td>
          <td>
            <div className="btn-group vocab__filters">
              <button className="vocab__filter btn btn-default active">All</button>
              <button className="vocab__filter btn btn-default">Cards</button>
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
        {cards}
      </tbody>
    </table>
  </div>