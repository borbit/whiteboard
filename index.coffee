express = require 'express'
mongoose = require 'mongoose'
passport = require 'lib/passport'
session = require 'express-session'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'
state = require 'express-state'
flash = require 'connect-flash'
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
app.use cookieParser()
app.use session
  secret: 'success'
  saveUninitialized: yes
  resave: yes

state.extend app
app.use passport.initialize()
app.use passport.session()
app.use flash()

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

# Routes
# ---------------------------------

[
  require 'lib/routes/index'
  require 'lib/routes/signup'
  require 'lib/routes/login'
].forEach (route) ->
  route app

# Run server
# ---------------------------------
app.listen config.port, config.host, (err) ->
  throw err if err

  console.log 'Application server started on',
    host: config.host
    port: config.port
