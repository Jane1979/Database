'use strict';
var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var UserSchema = new Schema({
  SurName: {
    type: String,
    Required: ''
  },
  Name: {
    type: String,
    Required: ''
  },
  Address: {
    type: String,
    Required: ''
  },
  ZipCode: {
    type: String,
    Required: ''
  },
  City: {
    type: String,
    Required: ''
  },
  PhoneNo: {
    type: String,
    Required: ''
  },
  Email: {
    type: String,
    Required: ''
  },
  Password: {
    type: String,
    Required: ''
  },
  TotalAmount: {
    type: Number,
    Required: ''
  }

});

module.exports = mongoose.model('Users', UserSchema);