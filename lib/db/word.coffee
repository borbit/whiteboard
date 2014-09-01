mongoose = require 'mongoose'
mongoose_time = require 'mongoose-time'

# define the schema for our word model
# ----------------------------------------
Schema = mongoose.Schema
  word: String
  pos: String

# populates created_at and updated_at
# ----------------------------------------
Schema.plugin mongoose_time()

# create the model for words and expose it
# ----------------------------------------
module.exports = mongoose.model 'Word', Schema