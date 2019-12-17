'use strict';
var mongoose = require('mongoose');
var Schema = mongoose.Schema;


var RatingSchema = new Schema({
  Value: {
    type: String,
    Required: ''
  },
  Comment: {
    type: String,
    Required: ''
  },
  CustomerID: {
    type: Number,
    Required: ''
  },
  ProductID: {
    type: Number,
    Required: ''
  }
});

module.exports = mongoose.model('Ratings', RatingSchema);