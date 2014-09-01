db = require 'lib/db'
# AppVocab = require 'public/blocks/app/app_vocab'

module.exports = (app) ->
  app.get '/', (req, res, next) ->
    loadCards req.user.id, (err, cards) ->
      return next err if err
      res.expose cards, 'vocab.cards'
      res.render 'index/index'

loadCards = (userId, cb) ->
  db.Card
    .find('user': userId)
    .populate('word', 'word pos')
    .select('word transcription translation pron')
    .exec (err, cards) ->
      return cb err if err
      cb null, cards