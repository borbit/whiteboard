# @cjsx React.DOM
React = require 'react'
Fluxxor = require 'fluxxor'

AppSign = require '../../blocks/app/app_sign'

# stores =
#   VocabStore: new VocabStore
#   FormWordStore: new FormWordStore
#   DetailsStore: new DetailsStore
#   CardStore: new CardStore

# actions =
#   VocabActions: VocabActions
#   FormWordActions: FormWordActions
#   DetailsActions: DetailsActions
#   CardActions: CardActions

# flux = new Fluxxor.Flux stores, actions

React.renderComponent <AppSign/>, document.getElementById 'app'