db = require 'lib/db'
React = require 'react/addons'
Fluxxor = require 'fluxxor'

VocabStore = require 'public/blocks/vocab/vocab-store'
FormWordStore = require 'public/blocks/form/form-word-store'
AppVocab = require 'public/blocks/app/app_vocab'

module.exports = (app) ->
  app.get '/', (req, res, next) ->
    loadCards req.user.id, (err, cards) ->
      return next err if err
      
      flux = new Fluxxor.Flux
        VocabStore: new VocabStore cards
        FormWordStore: new FormWordStore

      res.expose cards, 'vocab.cards'
      res.render 'index/index',
        body: React.renderComponentToString AppVocab
          flux: flux

loadCards = (userId, cb) ->
  db.Card
    .find('user': userId)
    .populate('word', 'word pos')
    .select('word transcription translation pron created_at')
    .exec (err, cards) ->
      return cb err if err
      cb null, cards