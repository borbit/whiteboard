# @cjsx React.DOM
React = require 'react'
FormWord = require '../form/form-word'
Modal = require '../modal/modal'
Card = require '../card/card'

module.exports = ->
  if @state.word
    modal = <Modal content={<Card word={@state.word}/>} onClosed={@onCardClosed} />

  words = @state.words.map (word) =>
    <tr>
      <td width="40"><input type="checkbox"/></td>
      <td onClick={@onWordClick} data-id={word._id}>
        <i className="vocab__play fa fa-play-circle"></i> 
        <span className="vocab__word">{word.word}</span> — 
        <span className="vocab__translation">{word.translation}</span>
      </td>
    </tr>

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
            <button className="btn btn-default">
              <i className="fa fa-align-justify"></i>
            </button>
          </td>
        </tr>
      </thead>
    </table>
    <table className="vocab__list table table-hover">
      <tbody>
        {words}
      </tbody>
    </table>
  </div>