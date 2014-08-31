mongoose = require 'mongoose'
mongoose_time = require 'mongoose-time'

# define the schema for our word definitions model
# ----------------------------------------
Schema = mongoose.Schema
  word: {type: mongoose.Schema.ObjectId, ref: 'Word'}
  user: {type: mongoose.Schema.ObjectId, ref: 'User'}
  definition: String
  rating: Number

# populates created_at and updated_at
# ----------------------------------------
Schema.plugin mongoose_time()

# create the model for word definitions and expose it
# ----------------------------------------
module.exports = mongoose.model 'WordDefinition', Schema