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
  for (k in keys) {
    var val = paramDict[keys[k]];
    switch (keys[k]) {
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


// Forms






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
    if (isNaN(result[i])) {
      dict[i] = result[i];
    } else {
      console.log(result[i]);
      dict[i] = parseInt(result[i]);
    }
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
var updateHeight = function(height) {
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
  async () => {
    await fetch(url)
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

        console.log("Dictionary Q " + dict);
        updateTable(dict);
        $('.form-wrap').css('display', 'none');
        $('.table-wrap').css('display', 'block');
        updateHeight($('.table-wrap').height());


        $('#response-table tr').click(
          function() {
            const id = $(this).children(':first-child').text();
            console.log(table);
            displayForm(table, $(this));
            $('.table-wrap').css('display', 'none');
            $('.form-wrap').css('display', 'block');
            updateHeight($('.form-wrap').height());
          }
        );
      });
  }
}

var deleteEntry = function(endpoint, table) {
  const host = "https://cors-anywhere.herokuapp.com/https://green-line-records-api.herokuapp.com/";
  // const host = "http://localhost:3000/";
  table = table.replace(" ", "_");
  var url = host + table + endpoint;
  console.log(url);
  fetch(url)
    .then((response) => {
      if (response.ok && (response.status == 200)) {
        $('.form-wrap').css('display', 'none');
        updateHeight($('.form-wrap').height());
        updateHeight($('.table-wrap').height());
      } else {
        throw new Error('Network response failure.');
      }
    });
}


// Runtime functionality
$('body').ready(function() {

  var table = $('#table').text();
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
    function(event) {
      event.preventDefault();
      var t = $(this).text();
      var g = $(this).parent().parent();
      $(g).children('.dropdown-toggle').text(t);
      table = t;
      hideDrop($(this).parent());
    }
  )

  // Input Listener
  $('.text-input').focus(function() {
    $('body').keypress(function(event) {

      // Act if keypress is 'Enter'
      if (event.keyCode == 13) {
        event.preventDefault();

        if ($('#type').text() == "Search") {
          // Check for valid dropdown inputs
          if (table == 'Query' || table == 'Table') {
            console.error("No table selected.");
          } else {
            var endpoint = analyzeSearch(str);
            // sendQuery(endpoint, table);

            var anal = new AnalyzeSearch(str, table);
            var s = anal.normalizeString();
            console.log("n string = ");
            console.log(s);
            var a = anal.sendQuery(s);

          }
        } else {
          // Check that a table is selected to add to.
          if (table == null) {
            console.error("No table selected.");
          } else {
            const qtable = table.replace(" ", "_");
            console.log('add', qtable);
            displayForm(qtable, null);
            $('.table-wrap').css('display', 'none');
            $('.form-wrap').css('display', 'block');
            updateHeight($('.form-wrap').height());
          }
        }
      }
    });
  });
});
