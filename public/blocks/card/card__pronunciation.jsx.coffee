# @cjsx React.DOM
React = require 'react'
Pron = require '../pron/pron'

module.exports = ->
  if @state.pronunciations
    pronunciations = @state.pronunciations.map (p) ->
      <tr>
        <td><input type="radio"/></td>
        <td><Pron transcription={p.transcription}/></td>
        <td><a className="card__user" href="#">@{p.user}</a></td>
      </tr>

    transcriptions =
      <div className="card__transcriptions">
        <table className="table table-condensed">
          {pronunciations}
        </table>
        <button className="card__btn-save btn btn-default btn-sm">
          <i className="fa fa-check"></i> Save
        </button>
        <button className="card__btn-record btn btn-default btn-sm">
          <i className="fa fa-microphone"></i> Record
        </button>
      </div>

  unless @state.editing
    transcription =
      <div className="card__transcription">
        <Pron transcription={@props.transcription}/>
        <i className="card__edit fa fa-pencil-square" onClick={@onEdit}></i>
      </div>
  else
    if @state.pronunciationsLoading
      toggle =
        <span className="card__toggle">
          <i className="fa fa-circle-o-notch fa-spin"></i> wait a moment
        </span>
    else if @state.pronunciations
      toggle =
        <span className="card__toggle" onClick={@hidePronunciations}>
          hide pronunciations
        </span>
    else
      toggle =
        <span className="card__toggle" onClick={@showPronunciations}>
          show pronunciations
        </span>

    transcription =
      <div className="card__transcription">
        <input className="card__input" defaultValue={@props.transcription} ref="input" />
        <i className="card__cancel fa fa-times" onClick={@onCancel}></i><br/>
        {toggle}
      </div>    

  <div className="card__pronunciation">
    {transcription}
    {transcriptions}
  </div>