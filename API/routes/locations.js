var express = require('express');
var router = express.Router();

var selectQuery = function(req, res, queryString) {
  	global.connection.query(queryString, function (error, results, fields) {
  		if (error) res.send(error);
  		// res.send(JSON.stringify({"status": 200, "error": null, "response": results}));
      res.send(results);
  	});
}

/* GET users listing. */
router.get('/', function(req, res) {
  selectQuery(req, res, "SELECT * FROM location");
});

router.get('/id/:id', function(req, res) {
  var id = req.params.id;
  selectQuery(req, res, "SELECT * FROM location where location_id=" + id + ";");
})

router.get('/count', function(req, res) {
  selectQuery(req, res, 'SELECT location.location_name, count(location.location_id) as Count FROM live_session join location on live_session.location_id = location.location_id group by location.location_id');
});

router.get('/live_session', function(req, res) {
  selectQuery(req, res, 'SELECT location.location_id, location_name, live_session.live_session_id, live_session.show_name FROM location join live_session on live_session.location_id = location.location_id');
});

router.get('/datetime', function(req, res) {
  selectQuery(req, res, 'SELECT location.location_id, location_name, live_session.location_id, live_session.date, live_session.start_time, live_session.end_time FROM location join live_session on live_session.location_id = location.location_id');
});

router.get('/add/:locationName', function(req, res) {
  var name = req.params.locationName
  var str = 'INSERT INTO LOCATION (location_name) VALUES (\'' + name + '\')';
  selectQuery(req, res,  str)
})

module.exports = router;
