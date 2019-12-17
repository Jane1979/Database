'use strict';


var mongoose = require('mongoose'),
  Rating = mongoose.model('Ratings');

exports.list_all_ratings = function(req, res) {
  Rating.find({}, function(err, rating) {
    if (err)
      res.send(err);
    res.json(rating);
  });
};


exports.create_a_rating = function(req, res) {
  var new_rating = new Rating(req.body);
  new_rating.save(function(err, rating) {
    if (err)
      res.send(err);
    res.json(rating);
  });
};


exports.see_a_rating = function(req, res) {
  Rating.findById(req.params.ratingId, function(err, rating) {
    if (err)
      res.send(err);
    res.json(rating);
  });
};


exports.update_a_rating = function(req, res) {
  Rating.findOneAndUpdate(req.params.ratingId, req.body, {new: true}, function(err, rating) {
    if (err)
      res.send(err);
    res.json(rating);
  });
};


exports.delete_a_rating = function(req, res) {
  Rating.remove({
    _id: req.params.ratingId
  }, function(err, rating) {
    if (err)
      res.send(err);
    res.json({ message: 'Rating successfully deleted' });
  });
};