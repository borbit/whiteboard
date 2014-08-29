# @cjsx React.DOM
page = require 'page'
React = require 'react'
AppSign = require '../../blocks/app/app_sign'

page '/signup', ->
  React.renderComponent <AppSign page="signup" errors={if signup?.errors then signup.errors}/>, document.getElementById 'app'
page '/login', ->
  React.renderComponent <AppSign page="login" errors={if login?.errors then login.errors}/>, document.getElementById 'app'
page dispatch: yes
