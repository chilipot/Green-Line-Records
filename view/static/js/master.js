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

// Analyzes Search string

const tableParameters = {
  'location' : [],
  'live_session' : [],
  'artist' : [],
  'member' : [],
}

/**
 * var analyzeSearch - Builds the endpoint using the given search string.
 *
 * @param  {String} search  The inputted search string.
 * @return {String}         An endpoint built using the search string.
 * @throws {Error}          Unable to parse the search string.
 */
var analyzeSearch = function(search) {
  var endpoint = "";
  if (search.length == 0) {
    return "";
  }
  var paramDict = {};
  var params = search.split(",");
  for (param in params) {
    var kv = params[param].split("=");
    paramDict[kv[0]] = kv[1];
  }
  var keys = Object.keys(paramDict);
  console.log(keys);
  for (k in keys) {
    var val = paramDict[keys[k]];
    switch(keys[k]) {
      case "id":
        endpoint += '/id/' + val;
        break;
      case "name":
        endpoint += '/name/' + val;
        break;
      default:
        console.log('Call special params');

    }
  }

  console.log(paramDict);
  console.log(endpoint);

  return endpoint;
}


// Helpers


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
  console.log(dict);
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
  var header = getHeaders(dict[0]);
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
var sendQuery = function(endpoint, table) {
  const host = "https://cors-anywhere.herokuapp.com/https://green-line-records-api.herokuapp.com/";
  // const host = "http://localhost:3000/";
  table = table.replace(" ", "_");
  var url = host + table + endpoint;
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
