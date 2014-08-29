React = require 'react/addons'
AppSign = require 'public/blocks/app/app_sign'

module.exports = (app) ->
  app.get '/login', (req, res) ->
    res.render 'sign/sign',
      body: React.renderComponentToString AppSign
        errors: req.flash 'login'
        page: 'login'