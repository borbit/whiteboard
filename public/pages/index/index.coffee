# @cjsx React.DOM
React = require 'react'
Fluxxor = require 'fluxxor'

VocabStore = require '../../blocks/vocab/vocab-store'
VocabActions = require '../../blocks/vocab/vocab-actions'
FormWordStore = require '../../blocks/form/form-word-store'
FormWordActions = require '../../blocks/form/form-word-actions'

App = require '../../blocks/app/app'

stores =
  VocabStore: new VocabStore()
  FormWordStore: new FormWordStore()

actions =
  VocabActions: VocabActions
  FormWordActions: FormWordActions

flux = new Fluxxor.Flux stores, actions

React.renderComponent <App flux={flux} />, document.getElementById 'app'