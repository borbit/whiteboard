mongoose = require 'mongoose'
mongoose_time = require 'mongoose-time'

# define the schema for our word pronunciations model
# ----------------------------------------
Schema = mongoose.Schema
  word: {type: mongoose.Schema.ObjectId, ref: 'Word'}
  user: {type: mongoose.Schema.ObjectId, ref: 'User'}
  mem_url: String
  rating: Number

# populates created_at and updated_at
# ----------------------------------------
Schema.plugin mongoose_time()

# create the model for word pronunciations and expose it
# ----------------------------------------
module.exports = mongoose.model 'WordMem', Schema