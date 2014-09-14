# @cjsx React.DOM
React = require 'react/addons'
BoardSheet = require './board__sheet'
cs = React.addons.classSet

module.exports = ->
  pageNumber = 0
  pager = @state.sheets.map =>
    buttonClasses = cs
      'btn': yes
      'btn-default': yes
      'active': pageNumber == @state.currentSheet

    <button className={buttonClasses}>{pageNumber++ + 1}</button>

  sheets = @state.sheets.map =>
    <BoardSheet/>

  <div className="board">
    <button className="board__back btn btn-default"><i className="fa fa-long-arrow-left"></i></button>
    <button className="board__bank btn btn-default"><i className="fa fa-bars"></i></button>
    <div className="board__pager btn-group-vertical">
      {pager}
      <button className="btn btn-default">
        <i className="fa fa-plus"></i>
      </button>
    </div>
    <div className="board__sheets">
      {sheets}
    </div>
  </div>