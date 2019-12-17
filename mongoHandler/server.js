var express = require('express'),
  app = express(),
  port = process.env.PORT || 3000,
  mongoose = require('mongoose'),
  Product = require('./api/models/productModel'),
  Rating = require('./api/models/ratingModel'),
  User = require('./api/models/userModel')
  bodyParser = require('body-parser');

var cors = require('cors')  
app.use(cors())
  
mongoose.Promise = global.Promise;
mongoose.connect('mongodb://localhost/Productdb'); 


app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


var routes = require('./api/routes/routes');
routes(app);


app.listen(port);


console.log('todo list RESTful API server started on: ' + port);
