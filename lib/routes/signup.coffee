React = require 'react/addons'
AppSign = require 'public/blocks/app/app_sign'
passport = require 'lib/passport'

module.exports = (app) ->
  app.get '/signup', (req, res) ->
    console.log res.locals
    errors = res.locals['signup.errors']
    res.expose errors, 'signup.errors'
    res.render 'sign/sign',
      body: React.renderComponentToString AppSign
        errors: errors
        page: 'signup'
  
  app.post '/signup', passport.authenticate('local-signup', {
    failureRedirect: '/signup'
    successRedirect: '/'
  })