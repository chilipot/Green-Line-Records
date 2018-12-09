var express = require('express');
var router = express.Router();

// Not a valid endpoint
router.get('/', function(req, res, next) {
  res.send("You shouldn't be here!");
});

module.exports = router;
