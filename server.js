
// Dependencies
var express = require('express');
var mongoose = require('mongoose');
var bodyParser = require('body-parser');

// MongoDB

mongoose.connect('YOURMONGODBHERE');

// Express
var app = express();

app.use(express.static(__dirname + '/public'));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(function(req, res, next){
  console.log(req.url);
  next();
});

// Routes
app.use('/api', require('./routes/api'));

// Start server
var port = 3000, ip = "localhost";

app.listen(port, function() {
  console.log('Express server listening on %d', port);
});
