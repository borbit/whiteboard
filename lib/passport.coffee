passport = require 'passport'
LocalStrategy = require('passport-local').Strategy
User = require('./db/user')

passport.serializeUser (user, done) ->
  done null, user.id

passport.deserializeUser (id, done) ->
  User.findById id, (err, user) ->
    done err, user

strategyOptions =
  usernameField: 'email'
  passwordField: 'password'
  passReqToCallback: yes

strategyVerify = (req, email, password, done) ->
  User.findOne {'local.email': email}, (err, user) ->
    return done err if err

    if user
      req.flash 'signup.errors', 'This email is already taken'
      req.res.locals.test = 123
      return done null, no
    
    user = new User
    user.local.email = email
    user.local.password = user.generateHash password
    user.save (err) ->
      return done err if err
      done null, user

strategy = new LocalStrategy strategyOptions, strategyVerify
passport.use 'local-signup', strategy

module.exports = passport