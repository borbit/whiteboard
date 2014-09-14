_ = require 'underscore'
async = require 'async'
db = require 'lib/db'

module.exports = (app) ->
  
  # Get card data
  # ---------------------------------
  app.get '/card/:cardId', (req, res, next) ->
    db.Card
      .findById(req.params.cardId)
      .populate('user')
      .populate('word')
      .populate('pron')
      .populate('definitions')
      .populate('examples')
      .populate('forms')
      .exec (err, words) ->
        return next err if err
        res.json words

  # Create a card
  # ---------------------------------
  app.post '/card', (req, res, next) ->
    data =
      word: req.body.word
      transcription: req.body.transcription
      translation: req.body.translation
      pos: req.body.pos
    
    async.auto {
      user: (cb) ->
        db.User.findById req.user.id, (err, user) ->
          return cb err if err
          return cb 'No user found' unless user
          cb null, user

      word: (cb) ->
        db.Word.findOne {'word': data.word}, (err, word) ->
          return cb err if err
          return cb null, word if word
          word = new db.Word
          word.word = data.word
          word.pos = data.pos
          word.save (err, word) -> 
            return cb err if err
            cb null, word

      card: ['user', 'word', (cb, scope) ->
        card = new db.Card
        card.user = scope.user
        card.word = scope.word
        card.transcription = data.transcription
        card.translation = data.translation
        card.save (err, card) -> 
          return cb err if err
          cb null, card
      ]
    }, (err, scope) ->
      return next err if err

      db.Card
        .findById(scope.card._id)
        .populate('user', 'username')
        .populate('word', 'word')
        .exec (err, data) ->
          return next err if err
          res.json data

  # Edit card data
  # ---------------------------------
  app.put '/card/:cardId', (req, res, next) ->
    data = _.pick req.body, 'learned'
    db.Card
      .findByIdAndUpdate(req.params.cardId, data)
      .exec (err, card) ->
        return next err if err
        res.json card

  # Delete card data
  # ---------------------------------
  app.del '/card/:cardId', (req, res, next) ->
    db.Card
      .findByIdAndRemove(req.params.cardId)
      .exec (err) ->
        return next err if err
        res.send 204
