var createError = require('http-errors');
var express = require('express');
var logger = require('morgan');

// Query Routes
var indexRouter = require('./routes/index');
var locationsRouter = require('./routes/locations');
var sessionRouter = require('./routes/live_recordings');
var artistRouter = require('./routes/artists');
var memberRouter = require('./routes/members');

var app = express();

var mysql = require("mysql");
//Database connection
app.use(function(req, res, next) {
  global.connection = mysql.createConnection({
    host: 'database-design.clxfur70m41w.us-east-1.rds.amazonaws.com',
    user: 'awsroot',
    password: 'charlesstein',
    database: 'green_line_records'
  });
  connection.connect();
  next();
});

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({
  extended: false
}));
// app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static('public'));

// Routes
app.use('/', indexRouter);
app.use('/location', locationsRouter);
app.use('/live_recording', sessionRouter);
app.use('/artist', artistRouter);
app.use('/club_member', memberRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});



module.exports = app;
