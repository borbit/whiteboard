passport = require 'lib/passport'

module.exports = (app) ->
  app.get '/auth/facebook', passport.authenticate('facebook', scope: 'email')
  app.get '/auth/facebook/callback',
    passport.authenticate 'facebook',
      failureRedirect : '/login'
      successRedirect : '/'