# @cjsx React.DOM
React = require 'react/addons'
Fluxxor = require 'fluxxor'

BoardStore = require '../../blocks/board/board-store'
BoardActions = require '../../blocks/board/board-actions'
AppBoard = require '../../blocks/app/app_board'

stores =
  BoardStore: new BoardStore

actions =
  BoardActions: BoardActions

flux = new Fluxxor.Flux stores, actions

React.renderComponent <AppBoard flux={flux}/>, document.getElementById 'app'
