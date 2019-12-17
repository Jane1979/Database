'use strict';
var mongoose = require('mongoose');
var Schema = mongoose.Schema;


var ProductSchema = new Schema({
  Name: {
    type: String,
    Required: ''
  },
  Description: {
    type: String,
    Required: ''
  },
  Url: {
    type: String,
    Required: ''
  },
  UnitPrice: {
    type: Number,
    Required: ''
  },
  Stock: {
    type: Number,
    Required: ''
  }
});

module.exports = mongoose.model('Products', ProductSchema);