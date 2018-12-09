var express = require('express');
var router = express.Router();

var query = function(req, res, queryString) {
  global.connection.query(queryString, function(error, results, fields) {
    if (error) res.send(error);
    console.log(queryString);
    res.send(results);
  });
}

// Get All
router.get('/', function(req, res) {
  query(req, res, "call get_project_data();");
});

// Get Entries That Match The Private Key
router.get('/id/:id', function(req, res) {
  var id = req.params.id;
  query(req, res, `call get_project_data_id(${id})`);
})

// Get Entries That Match The Given Name
router.get('/name/:name', function(req, res) {
  var name = req.params.name;
  query(req, res, `call get_project_data_name('${name}')`);
});

// DELETE
router.get('/delete/:id', function(req, res) {
  var id = req.params.id;
  query(req, res, 'delete from project where project_id=' + id);
})

module.exports = router;
