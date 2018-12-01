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
  selectQuery(req, res, "SELECT * FROM club_member");
});

router.get('/id/:id', function(req, res) {
  var id = req.params.id;
  var qres = new Query('club_member')
  qres.setStatement('SELECT')
  qres.addColumn('*');
  qres.addWhereCond("where member_id=" + id)
  selectQuery(req, res, qres.buildQuery());
})

// Gets According to club_member names
router.get('/name', function(req, res) {
  selectQuery(req, res, 'SELECT firstname, lastname FROM club_member');
});

router.get('/name/:name', function(req, res) {
  var name = req.params.name;
  name = name.split(" ");
  var cond = [];
  if (name.length > 1) {
    cond = [`firstname like \'${name[0]}%\'`, `lastname like \'${name[1]}%\'`,`lastname like \'${name[0]}%\'`, `firstname like \'${name[1]}%\'`];
    selectQuery(req, res, `SELECT * FROM club_member where ${cond[0]} and ${cond[1]} or ${cond[2]} and ${cond[3]};`);
  }
  else {
    cond = [`firstname like \'${name[0]}%\'`, `lastname like \'${name[0]}%\'`];
    selectQuery(req, res, `SELECT * FROM club_member where ${cond[0]} or ${cond[1]};`);
  }
});



module.exports = router;
