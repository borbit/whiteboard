# @cjsx React.DOM
page = require 'page'
React = require 'react'
AppSign = require '../../blocks/app/app_sign'

page '/signup', ->
  appSignup = <AppSign
    page="signup"
    errors={if signup?.errors then signup.errors}
    values={if signup?.values then signup.values}
  />
  React.renderComponent appSignup, document.getElementById 'app'
page '/login', ->
  appLogin = <AppSign
    page="login"
    errors={if login?.errors then login.errors}
    values={if login?.values then login.values}
  />
  React.renderComponent appLogin, document.getElementById 'app'
page dispatch: yes
