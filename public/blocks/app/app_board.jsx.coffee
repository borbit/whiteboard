# @cjsx React.DOM
React = require 'react/addons'
Board = require '../../blocks/board/board'

module.exports = ->
  <div className="app app_board">
    <div className="app__page">
      <Board/>
    </div>
  </div>