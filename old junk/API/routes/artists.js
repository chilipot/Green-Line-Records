var express = require('express');
var router = express.Router();

var query = function(req, res, queryString) {
  global.connection.query(queryString, function(error, results, fields) {
    if (error) res.send(error);
    console.log(queryString);
    // res.send(JSON.stringify({"status": 200, "error": null, "response": results}));
    res.send(results);
  });
}

// Get All Entries
router.get('/', function(req, res) {
  query(req, res, "call get_artist_data();");
});

// Get Entries That Have The Given Private Key
router.get('/id/:id', function(req, res) {
  var id = req.params.id;
  query(req, res, `call get_artist_data_id(${id});`);
})

// Get Entries That Have The Given Name
router.get('/name/:name', function(req, res) {
  var name = req.params.name;
  query(req, res, `call get_artist_data_name('${name}');`);
});


// DELETE
router.get('/delete/:id', function(req, res) {
  var id = req.params.id;
  query(req, res, 'delete from artist where artist_id=' + id);
})


module.exports = router;
