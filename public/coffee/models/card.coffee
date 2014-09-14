Backbone = require 'backbone'

class Card extends Backbone.Model
  idAttribute: '_id'
  urlRoot: '/card'    

module.exports = Card