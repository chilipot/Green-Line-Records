var express = require('express');
var router = express.Router();

// middleware that is specific to this router
router.use(function timeLog (req, res, next) {
  console.log('Time: ', Date.now())
  next()
})

var query = function(req, res, queryString) {
  	global.connection.query(queryString, function (error, results, fields) {
  		if (error) throw error;
      console.log(queryString);
      res.send(results);
  	});
}

// Gets All
router.get('/', function(req, res) {
  query(req, res, 'call get_live_recording_data();');
});

// Get Entries That Match The Private Key
router.get('/id/:id', function(req, res) {
  var id = req.params.id;
  query(req, res, `call get_live_recording_data_id(${id})`);
});

// Get Entries That Match The Given Name
router.get('/name/:name', function(req, res) {
  var name = req.params.name;
  query(req, res, `call get_live_recording_data_name('${name}')`);
});

// DELETE
router.get('/delete/:id', function(req, res) {
  var id = req.params.id;
  query(req, res, 'delete from live_recording where live_recording_id=' + id);
})

module.exports = router;
