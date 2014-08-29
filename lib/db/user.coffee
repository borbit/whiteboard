mongoose = require 'mongoose'
crypto = require 'crypto'

# define the schema for our user model
# ----------------------------------------
userSchema = mongoose.Schema
  facebook:
    id        : String
    token     : String
    email     : String
    name      : String
  local:
    email     : String
    password  : String

# generating a hash
# ----------------------------------------
userSchema.methods.generateHash = (password) ->
  md5 = crypto.createHash 'md5'
  md5 = md5.update password
  md5 = md5.digest 'hex'

# checking if password is valid
# ----------------------------------------
userSchema.methods.validPassword = (password) ->
  md5 = crypto.createHash 'md5'
  md5 = md5.update password
  md5 = md5.digest 'hex'
  md5 == @local.password

# create the model for users and expose it
# ----------------------------------------
module.exports = mongoose.model 'User', userSchema