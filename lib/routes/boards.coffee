db = require 'lib/db'

module.exports = (app) ->
  app.get '/boards', (req, res, next) ->  
    res.render 'board/board'
