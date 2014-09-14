mongoose = require 'mongoose'
mongoose_time = require 'mongoose-time'

# define the schema for our cards model
# ----------------------------------------
Schema = mongoose.Schema
  word: {type: mongoose.Schema.ObjectId, ref: 'Word'}
  user: {type: mongoose.Schema.ObjectId, ref: 'User'}
  definitions: [{type: mongoose.Schema.ObjectId, ref: 'WordDefinition'}]
  examples: [{type: mongoose.Schema.ObjectId, ref: 'WordExample'}]
  forms: [{type: mongoose.Schema.ObjectId, ref: 'WordForm'}]
  pron: {type: mongoose.Schema.ObjectId, ref: 'WordPron'}
  transcription: String
  translation: String
  learned: Boolean

# populates created_at and updated_at
# ----------------------------------------
Schema.plugin mongoose_time()

# create the model for cards and expose it
# ----------------------------------------
module.exports = mongoose.model 'Card', Schema