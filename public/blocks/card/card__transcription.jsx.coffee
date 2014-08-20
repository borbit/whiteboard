# @cjsx React.DOM
React = require 'react'
Pron = require '../pron/pron'

module.exports = ->
  unless @state.editing
    transcription =
      <span className="card__transcription">
        <Pron transcription={@props.transcription}/>
        <i className="card__edit fa fa-pencil-square" onClick={@onEdit}></i>
      </span>
  else
    transcription =
      <section className="card__transcriptions">
        <i className="card__close fa fa-times" onClick={@onClose}></i>
        <b className="card__title">Pronunciations:</b>
        <table className="table table-condensed">
          <tr>
            <td><input type="radio"/></td>
            <td><Pron transcription={@props.transcription}/></td>
            <td>@borbit</td>
          </tr>
          <tr>
            <td><input type="radio"/></td>
            <td><Pron transcription={@props.transcription}/></td>
            <td>@borbit</td>
          </tr>
        </table>
        <button className="card__btn-save btn btn-default btn-sm">
          <i className="fa fa-check"></i> Save
        </button>
        <button className="card__btn-record btn btn-default btn-sm">
          <i className="fa fa-microphone"></i> Record
        </button>
      </section>

  transcription