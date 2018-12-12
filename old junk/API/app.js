var createError = require('http-errors');
var express = require('express');
var logger = require('morgan');

// Query Routes
var indexRouter = require('./routes/index');
var locationsRouter = require('./routes/locations');
var recordingRouter = require('./routes/live_recordings');
var artistRouter = require('./routes/artists');
var memberRouter = require('./routes/members');
var releaseRouter = require('./routes/releases');
var projectRouter = require('./routes/projects');
var eventRouter = require('./routes/events');
var procedureRouter = require('./routes/modules/procedure');

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
app.use('/live_recording', recordingRouter);
app.use('/artist', artistRouter);
app.use('/club_member', memberRouter);
app.use('/release', releaseRouter);
app.use('/project', projectRouter);
app.use('/event', eventRouter);
app.use('/util', procedureRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'production' ? err : {};

  // render the error page
  res.status(err.status || 500);
});

module.exports = app;
