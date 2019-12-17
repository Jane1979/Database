'use strict';
module.exports = function(app) {
  var products = require('../controllers/productController');
  var ratings = require('../controllers/ratingController');
  var users = require('../controllers/userController');
  
  // products Routes
  app.route('/products')
    .get(products.list_all_products)
    .post(products.create_a_product);


  app.route('/products/:productID')
    .get(products.see_a_product)
    .put(products.update_a_product)
    .delete(products.delete_a_product);


  // ratings Routes
  app.route('/ratings')
    .get(ratings.list_all_ratings)
    .post(ratings.create_a_rating);


  app.route('/ratings/:ratingID')
    .get(ratings.see_a_rating)
    .put(ratings.update_a_rating)
    .delete(ratings.delete_a_rating);


  // users Routes
  app.route('/users')
    .get(users.list_all_users)
    .post(users.create_a_user);


  app.route('/users/:userID')
    .get(users.see_a_user)
    .put(users.update_a_user)
    .delete(users.delete_a_user);
};