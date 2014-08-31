mongoose = require 'mongoose'
mongoose_time = require 'mongoose-time'
crypto = require 'crypto'

# define the schema for our user model
# ----------------------------------------
Schema = mongoose.Schema
  username: String
  firstname: String
  lastname: String
  auth_facebook:
    id: String
    token: String
    email: String
    name: String
  auth_local:
    email: String
    password: String

# generating a hash
# ----------------------------------------
Schema.methods.generateHash = (password) ->
  md5 = crypto.createHash 'md5'
  md5 = md5.update password
  md5 = md5.digest 'hex'

# checking if password is valid
# ----------------------------------------
Schema.methods.validPassword = (password) ->
  md5 = crypto.createHash 'md5'
  md5 = md5.update password
  md5 = md5.digest 'hex'
  md5 == @auth_local.password

# populates created_at and updated_at
# ----------------------------------------
Schema.plugin mongoose_time()

# create the model for users and expose it
# ----------------------------------------
module.exports = mongoose.model 'User', Schema