config = require 'config'
passport = require 'passport'
LocalStrategy = require('passport-local').Strategy
FacebookStrategy = require('passport-facebook').Strategy
User = require './db/user'

passport.serializeUser (user, done) ->
  done null, user._id.toString()

passport.deserializeUser (id, done) ->
  User.findById id, (err, user) ->
    done err, user

verifySignupOptions =
  usernameField: 'email'
  passwordField: 'password'
  passReqToCallback: yes

verifySignup = (req, email, password, done) ->
  User.findOne {'local.email': email}, (err, user) ->
    return done err if err

    if user
      return done null, no, 'Oops! This email is already taken.'
    
    user = new User
    user.auth_local.email = email
    user.auth_local.password = user.generateHash password
    user.save (err) ->
      return done err if err
      done null, user

verifyLoginOptions =
  usernameField: 'email'
  passwordField: 'password'
  passReqToCallback: yes

verifyLogin = (req, email, password, done) ->
  User.findOne {'local.email': email}, (err, user) ->
    return done err if err

    unless user
      return done null, no, 'Oops! No user found.'
    unless user.validPassword password
      return done null, no, 'Oops! Wrong password.'
    
    done null, user

facebookConnectOptions =
  clientID: config.auth_facebook.client_id,
  clientSecret: config.auth_facebook.client_secret,
  callbackURL: config.auth_facebook.callback_url

facebookConnect = (token, refreshToken, profile, done) ->
  User.findOne 'facebook.id': profile.id, (err, user) ->
    return done err if err

    if user
      return done null, user
    else
      user = new User
      user.auth_facebook.id = profile.id
      user.auth_facebook.token = token
      user.auth_facebook.name = "#{profile.name.givenName} #{profile.name.familyName}"
      user.auth_facebook.email = profile.emails[0].value

      user.save (err) ->
        return done err if err
        return done null, user

passport.use new FacebookStrategy(facebookConnectOptions, facebookConnect)
passport.use 'local-signup', new LocalStrategy(verifySignupOptions, verifySignup)
passport.use 'local-login', new LocalStrategy(verifyLoginOptions, verifyLogin)

module.exports = passport