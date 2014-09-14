# @cjsx React.DOM
React = require 'react/addons'
FormWord = require '../form/form-word'

module.exports = ->
  if @props.isSelectedAny
    toolbar.push(
      <td>
        <div className="btn-group">
          <button className="btn btn-default" onClick={@props.onRemove}>
            <i className="fa fa-times"></i> Remove
          </button>
          <button className="btn btn-default" onClick={@props.onSetLearned}>
            <i className="fa fa-dot-circle-o"></i> Learned
          </button>
        </div>
      </td>)
  else
    toggleIconClass = cs
      'fa': yes
      'fa-align-justify': !@props.condensed
      'fa-bars': @props.condensed

    toolbar.push(<td width="250"><FormWord onAdd={@props.onCardAdd}/></td>)
    toolbar.push(
      <td>
        <div className="btn-group vocab__filters">
          <button className="vocab__filter btn btn-default active">All</button>
          <button className="vocab__filter btn btn-default">Words</button>
          <button className="vocab__filter btn btn-default">Phrases</button>
        </div>
        <button className="btn btn-default" onClick={@props.onViewToggle}>
          <i className={toggleIconClass}></i>
        </button>
      </td>)

  <table className="vocab__head table">
    <thead>
      <tr>
        <td width="40">
          <input
            type="checkbox"
            onChange={@props.onSelectAll}
            disabled={@props.isSelectable}
            checked={@props.isSelectedAll}
          />
        </td>
        {toolbar}
      </tr>
    </thead>
  </table>