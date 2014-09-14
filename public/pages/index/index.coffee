# @cjsx React.DOM
require '../../coffee/bootstrap'

React = require 'react/addons'
Fluxxor = require 'fluxxor'

VocabStore      = require '../../blocks/vocab/vocab-store'
VocabActions    = require '../../blocks/vocab/vocab-actions'
FormWordStore   = require '../../blocks/form/form-word-store'
FormWordActions = require '../../blocks/form/form-word-actions'
DetailsStore    = require '../../blocks/details/details-store'
DetailsActions  = require '../../blocks/details/details-actions'
CardStore       = require '../../blocks/card/card-store'
CardActions     = require '../../blocks/card/card-actions'

AppVocab = require '../../blocks/app/app_vocab'

stores =
  VocabStore: new VocabStore vocab.cards
  FormWordStore: new FormWordStore
  DetailsStore: new DetailsStore
  CardStore: new CardStore

actions =
  VocabActions: VocabActions
  FormWordActions: FormWordActions
  DetailsActions: DetailsActions
  CardActions: CardActions

flux = new Fluxxor.Flux stores, actions

React.renderComponent <AppVocab flux={flux} />, document.getElementById 'app'