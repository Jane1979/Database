var express = require('express');
var app = express(),
  port = process.env.PORT || 3010,
  bodyParser = require('body-parser');

var cors = require('cors');
app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


var routes = require('./api/routes/gamesRoutes');
routes(app);


var server = app.listen(port, function () {
    console.log('Server is running on port '+ port);
});