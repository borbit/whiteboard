async = require 'async'
db = require 'lib/db'

module.exports = (app) ->
  
  # Get all user cards
  # ---------------------------------
  app.get '/cards/:userId', (req, res, next) ->
    db.Card
      .find('user': req.params.userId)
      .populate('word', 'word')
      .exec (err, words) ->
        return next err if err
        res.json words

  # Create a new card
  # ---------------------------------
  app.post '/cards/:userId', (req, res, next) ->
    data =
      word: 'test'
      transcription: 'transcription'
      translation: 'translation'
    
    async.auto {
      user: (cb) ->
        db.User.findById req.params.userId, (err, user) ->
          return cb err if err
          return cb 'No user found' unless user
          cb null, user

      word: (cb) ->
        db.Word.findOne {'word': data.word}, (err, word) ->
          return cb err if err
          return cb null, word if word
          word = new db.Word
          word.word = data.word
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

  # Edit card data
  # ---------------------------------
  app.post '/card/:cardId', (req, res, next) ->

  # Delete card data
  # ---------------------------------
  app.del '/card/:cardId', (req, res, next) ->
