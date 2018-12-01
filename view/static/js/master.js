// Dropdown implementation

var displayDrop = function(menu) {
  var group = menu.parent();
  menu.addClass('show');
  menu.css('display', 'block');
  group.addClass('show');
}

var hideDrop = function(menu) {
  menu.removeClass('show');
  menu.css('display', 'none');
  menu.parent().removeClass('show');
}

// Helpers

/**
 * var analyzeSearch - Builds the endpoint using the given search string.
 *
 * @param  {String} search  The inputted search string.
 * @return {String}         An endpoint built using the search string.
 * @throws {Error}          Unable to parse the search string.
 */
var analyzeSearch = function(search) {
  var endpoint = "";
  if (search == 0) {
    return "";
  }
  var paramDict = {};
  console.log(search);
  var params = search.spilt(" ");
  for (param in params) {
    var kv = param.split('=');
    paramDict[kv[0]] = kv[1];
  }

  var keys = Object.keys(paramDict);
  for (k in keys) {
    var val = paramDict[k];

    switch(k) {
      case 'id':
        endpoint += '/id/' + val;
        break;
    }
  }

  console.log(paramDict);

  return endpoint;
}

/**
 * var convertToDict - Converts a JSON string into a dictionary structure.
 *
 * @param  {String}       json  description
 * @return {Dictionary}         description
 */
var convertToDict = function(json) {
  var result = JSON.parse(json);
  var dict = {};
  for (var i = 0; i < result.length; i++) {
    dict[i] = result[i];
  }
  return dict;
}

// Modifies Table Display
/**
 * var getHeaders - Grabs the headers of the dictionary.
 *
 * @param  {String} dict JSON dictionary string.
 * @return {String}      Table headers.
 */
var getHeaders = function(dict) {
  const keys = Object.keys(dict);
  var html = "";
  for (header in keys) {
    html += '<th>' + keys[header] + '</th>';
  }
  html = '<tr>' + html + '</tr>';
  return html;
}

/**
 * var getRows - Grabs the data from dictionary rows.
 *
 * @param  {String} dict  JSON dictionary string.
 * @return {String}       HTML Table rows.
 */
var getRows = function(dict) {
  const keys = Object.keys(dict);
  var html = "";
  for (header in keys) {
    var rowDict = dict[keys[header]];
    var rowKeys = Object.keys(rowDict);
    var rowHTML = "";
    for (headerRow in rowKeys) {
      var rowVal = rowDict[rowKeys[headerRow]];
      console.log(rowVal);
      rowHTML += '<td>' + rowVal + '</td>';
    }
    html += '<tr>' + rowHTML + '</tr>';
  }

  return html;
}

/**
 * var updateTable - Populates the table with the information from the API
 * request.
 *
 * @param  {String} dict  The API response as a dictionary.
 * @return {None}         Updates the table.
 */
var updateTable = function(dict) {
  const table = $('#response-table');
  var header = getHeaders(dict[1]);
  var rows = getRows(dict);

  table.html(header + rows);
}

/**
 * var updateHeight - Modifies the height of the elements to accomodate the
 * table data.
 *
 * @return {Void}  Updates the value of the html heights.
 */
var updateHeight = function() {
  var height = $('.table-wrap').height();
  $('.data-table').height(height + 200);
}

// MySQL Database connection
/**
 * var sendQuery - Sends a request to the API.
 *
 * @param  {String} endpoint  The API endpoint.
 * @return {JSON}             The JSON response from the API.
 * @throws {Error}            Endpoint Error.
 */
var sendQuery = function(endpoint, transaction) {
  const host = "https://green-line-records-api.herokuapp.com/";
  var url = host + transaction + endpoint;
  console.log(url);
  fetch(url)
    .then((response) => {
      if (response.ok && (response.status == 200)) {
        return response.json();
      }
      throw new Error('Network response failure.');
    })
    .then((myJson) => {
      var str = JSON.stringify(myJson);
      var dict = convertToDict(str);
      return dict;
    })
    .then((dict) => {
      updateTable(dict);

      updateHeight();
    });
}


// Runtime functionality
$('body').ready(function() {

  var table;
  var type = "SELECT";

  // Dropdown Listeners
  $('.dropdown-menu').hide().removeClass('show');
  $('.dropdown-toggle').mouseenter(
    function() {
      var p = $(this).parent();
      displayDrop($(p).children('.dropdown-menu'));

    }
  );

  $('.btn-group').mouseleave(
    function() {
      var menu = $(this).children('.dropdown-menu');
      hideDrop(menu);
    }
  )
  $('.dropdown-item').click(
    function() {
      var t = $(this).text();
      table = t;
      var g = $(this).parent().parent();
      $(g).children('.dropdown-toggle').text(t);
      hideDrop($(this).parent());
    }
  )

  // Input Listener
  $('body').keypress(function(event) {
    if (event.keyCode == 13) {
      var str = $('.text-input').val();

      if (str.length == 0) {
        str = "";
      }

      event.preventDefault();

      if (table == null) {
        console.error("No table selected.");
      } else {
        var endpoint = analyzeSearch(str);
        sendQuery(endpoint, table);
      }
    }
  });

});
