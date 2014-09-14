# @cjsx React.DOM
React = require 'react/addons'

module.exports = ->
  <tr>
    <td width="40">
      <input
        type="checkbox"
        checked={!!@props.card.selected}
        onChange={@props.onSelect}
      />
    </td>
    <td>
      <span onClick={@props.onClick}>
        <i className="vocab__play fa fa-play-circle"></i> 
        <span className="vocab__word">{@props.card.word.word}</span> — 
        <span className="vocab__translation">{@props.card.translation}</span>
      </span>
    </td>
    <td width="40">
      {if @props.card.learned
        <i className="vocab__learn fa fa-circle" onClick={@props.onSetLearned}></i>
      else
        <i className="vocab__learn fa fa-circle-o" onClick={@props.onUnsetLearned}></i>
      }
    </td>
  </tr>