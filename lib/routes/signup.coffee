React = require 'react/addons'
AppSign = require 'public/blocks/app/app_sign'
passport = require 'lib/passport'

module.exports = (app) ->
  app.get '/signup', (req, res) ->
    if req.isAuthenticated()
      return res.redirect '/'
    res.render 'sign/sign',
      body: React.renderComponentToString AppSign
        page: 'signup'
  
  app.post '/signup', (req, res, next) ->
    passport.authenticate('local-signup', (err, user, message) ->
      if err then return next err
      if not user
        res.expose [message], 'signup.errors'
        res.expose req.body, 'signup.values'
        res.render 'sign/sign',
          body: React.renderComponentToString AppSign
            errors: [message]
            values: req.body
            page: 'signup'
      else
        req.logIn user, (err) ->
          if err then return next err
          res.redirect '/'

    )(req, res, next)