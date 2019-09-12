var express = require('express');
var router = express.Router();

var query = function(req, res, queryString) {
  global.connection.query(queryString, function(error, results, fields) {
    if (error) res.send(error);
    res.send(results);
  });
}
var multiQuery = function(req, res, queryString) {
  global.connection.query(queryString, function(error, results, fields) {
    console.log(error);
    if (error) res.send(error);
    return results;
  });
}

/* GET users listing. */
router.get('/table/:table/id/:id', function(req, res) {
  const table = req.params.table;
  const id = req.params.id;
  query(req, res, `select convert_fk_to_string('${table}', ${id}) as 'name';`);
});

router.get('/table/:table/name/:name', function(req, res) {
  const table = req.params.table;
  const name = req.params.name;
  query(req, res, `select convert_string_to_pk('${table}', '${name}') as 'pk';`);
});

module.exports = router;
