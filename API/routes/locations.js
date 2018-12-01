var express = require('express');
const Query = require('./modules/default');
var router = express.Router();

var selectQuery = function(req, res, queryString) {
  global.connection.query(queryString, function(error, results, fields) {
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
  var qres = new Query('location')
  qres.setStatement('SELECT')
  qres.addColumn('*');
  qres.addWhereCond("where location_id=" + id)
  selectQuery(req, res, qres.buildQuery());
})

// Gets According to Location names
router.get('/name', function(req, res) {
  selectQuery(req, res, 'SELECT location_name FROM location');
});

router.get('/name/:name', function(req, res) {
  var name = req.params.name;
  var str = new Query('location')
  selectQuery(req, res, str.getByName(name, 'location_name'));
});



module.exports = router;
