_ = require 'underscore'
express = require 'express'
mongoose = require 'mongoose'
passport = require 'lib/passport'
cookieParser = require 'cookie-parser'
cookieSession = require 'cookie-session'
bodyParser = require 'body-parser'
state = require 'express-state'
engines = require 'consolidate'
config = require 'config'

# Setup express
# ---------------------------------
app = express()
app.set 'env', config.NODE_ENV
app.set 'strict routing', no
app.set 'views', 'public/pages'
app.set 'view engine', 'ejs'
app.engine 'ejs', engines.ejs
app.enable 'trust proxy'
app.use express.static __dirname + '/public/'
app.use bodyParser.urlencoded extended: yes
app.use bodyParser.json()
app.use cookieParser 'secret'
app.use cookieSession
  maxAge: 604800000 # 1 week
  secret: 'secret'

app.use passport.initialize()
app.use passport.session()
state.extend app

# Connect to mongodb
# ---------------------------------
mongoose.connect config.mongo_url

# Setup ejs templates
# ---------------------------------
try
  manifest = require config.dist_manifest_path
catch e
  manifest = {}

app.locals.asset = (src) ->
  if manifest[src]
    src = "/dist/#{manifest[src]}"
  "/#{src}"

app.locals.dist = (src) ->
  if manifest[src]
    src = manifest[src]  
  "/dist/#{src}"

# Check if client is authenticated
# ---------------------------------
app.all '*', (req, res, next) ->
  allowed = [
    '/login'
    '/signup'
    '/about'
    '/auth/facebook'
    '/auth/facebook/callback'
  ]
  return next() if req.isAuthenticated()
  return next() if _.contains allowed, req.path
  res.redirect '/login'

# Routes
# ---------------------------------
[
  require 'lib/routes/index'
  require 'lib/routes/signup'
  require 'lib/routes/login'
  require 'lib/routes/logout'
  require 'lib/routes/auth'
  require 'lib/routes/cards'
  require 'lib/routes/boards'
].forEach (route) ->
  route app

# Run server
# ---------------------------------
app.listen config.port, config.host, (err) ->
  throw err if err

  console.log 'Application server started on',
    host: config.host
    port: config.port
