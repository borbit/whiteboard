React = require 'react/addons'
AppSign = require 'public/blocks/app/app_sign'
passport = require 'lib/passport'

module.exports = (app) ->
  app.get '/login', (req, res) ->
    if req.isAuthenticated()
      return res.redirect '/'
    res.render 'sign/sign',
      body: React.renderComponentToString AppSign
        page: 'login'

  app.post '/login', (req, res, next) ->
    passport.authenticate('local-login', (err, user, message) ->
      if err then return next err
      if not user
        res.expose [message], 'login.errors'
        res.expose req.body, 'login.values'
        res.render 'sign/sign',
          body: React.renderComponentToString AppSign
            errors: [message]
            values: req.body
            page: 'login'
      else
        req.logIn user, (err) ->
          if err then return next err
          res.redirect '/'

    )(req, res, next)