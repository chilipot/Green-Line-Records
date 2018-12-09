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
  query(req, res, "call get_member_data();");
});

// Get Entries That Match The Given Private Key
router.get('/id/:id', function(req, res) {
  var id = req.params.id;
  query(req, res, `call get_member_data_id(${id});`);
})

// Get Entries That Match The Given Name
router.get('/name/:name', function(req, res) {
  var name = req.params.name;
  name = name.split(" ");
  if (name.length > 1) {
    query(req, res, `call get_member_data_name('${name[0]}','${name[1]}');`);
  }
  else {
    query(req, res, `call get_member_data_name('${name[0]}','');`);
  }
});

// DELETE
router.get('/delete/:id', function(req, res) {
  var id = req.params.id;
  query(req, res, 'delete from club_member where member_id=' + id);
})

module.exports = router;
