const host = "https://cors-anywhere.herokuapp.com/https://green-line-records-api.herokuapp.com/";



/**
 * Handles the inputs for the Form.
 */
class FormLayouts {
  constructor(row) {
    this.row = row;
  }


  /**
   * buildLocation - Returns the inputs for a Location Table.
   *
   * @return {Object}  A dictionary of columns and row values.
   */
  buildLocation() {
    const inputs = {
      'ID': $(this.row).children(':nth-child(1)').text() || "",
      'Location': $(this.row).children(':nth-child(2)').text() || "",
    }

    return inputs;
  }


  /**
   * buildLiveRecording - Returns the inputs for a Live Session Table.
   *
   * @return {Object}  A dictionary of columns and row values;
   */
  buildLiveRecording() {
    const inputs = {
      'ID': $(this.row).children(':nth-child(1)').text() || "",
      'Name': $(this.row).children(':nth-child(2)').text() || "",
      'Date': $(this.row).children(':nth-child(3)').text() || "",
      'Start': $(this.row).children(':nth-child(4)').text() || "",
      'End': $(this.row).children(':nth-child(5)').text() || "",
      'Location': $(this.row).children(':nth-child(6)').text() || "",
    }

    return inputs;
  }

  /**
   * buildArtist - Returns the inputs for an Artist Table
   *
   * @return {Object}  A dictionary of columns and row values;
   */
  buildArtist() {
    const inputs = {
      'ID': $(this.row).children(':nth-child(1)').text() || "",
      'Name': $(this.row).children(':nth-child(2)').text() || "",
    }

    return inputs;
  }

  /**
   * buildClubMember - Returns the inputs for a Club Member Table
   *
   * @return {Object}  A dictionary of columns and row values;
   */
  buildClubMember() {
    const inputs = {
      'ID': $(this.row).children(':nth-child(1)').text() || "",
      'Email': $(this.row).children(':nth-child(2)').text() || "",
      'Last': $(this.row).children(':nth-child(3)').text() || "",
      'First': $(this.row).children(':nth-child(4)').text() || "",
    }

    return inputs;
  }

  /**
   * buildProject - Returns the inputs for a Project Table
   *
   * @return {Object}  A dictionary of columns and row values;
   */
  buildProject() {
    const inputs = {
      'ID': $(this.row).children(':nth-child(1)').text() || "",
      'Title': $(this.row).children(':nth-child(2)').text() || "",
      'Type': $(this.row).children(':nth-child(3)').text() || "",
      'Status': $(this.row).children(':nth-child(4)').text() || "",
      'Genre': $(this.row).children(':nth-child(5)').text() || "",
      'Project Manager': $(this.row).children(':nth-child(6)').text() || "",
      'Campaign Manager': $(this.row).children(':nth-child(7)').text() || "",
      'Engineers': $(this.row).children(':nth-child(8)').text() || "",
    }

    return inputs;
  }

  /**
   * buildRelease - Returns the inputs for a Release Table
   *
   * @return {Object}  A dictionary of columns and row values;
   */
  buildRelease() {
    const inputs = {
      'ID': $(this.row).children(':nth-child(1)').text() || "",
      'Project': $(this.row).children(':nth-child(2)').text() || "",
      'Date': $(this.row).children(':nth-child(3)').text() || "",
      'Link': $(this.row).children(':nth-child(4)').text() || "",
    }

    return inputs;
  }

  /**
   * buildEvent - Returns the inputs for am Event Table
   *
   * @return {Object}  A dictionary of columns and row values;
   */
  buildEvent() {
    const inputs = {
      'ID': $(this.row).children(':nth-child(1)').text() || "",
      'Date': $(this.row).children(':nth-child(2)').text() || "",
      'Title': $(this.row).children(':nth-child(3)').text() || "",
      'Description': $(this.row).children(':nth-child(4)').text() || "",
      'Turnout': $(this.row).children(':nth-child(5)').text() || "",
      'GLR Artist': $(this.row).children(':nth-child(6)').text() || "",
    }

    return inputs;
  }

  /**
   * buildEngineer - Returns the inputs for am Engineer Table
   *
   * @return {Object}  A dictionary of columns and row values;
   */
  buildEngineer() {
    const inputs = {
      'ID': $(this.row).children(':nth-child(1)').text() || "",
      'Date': $(this.row).children(':nth-child(2)').text() || "",
      'Level': $(this.row).children(':nth-child(3)').text() || "",
    }

    return inputs;
  }

  /**
   * buildContribution - Returns the inputs for am Contribution Table
   *
   * @return {Object}  A dictionary of columns and row values;
   */
  buildContribution() {
    const inputs = {
      'ID': $(this.row).children(':nth-child(1)').text() || "",
      'Name': $(this.row).children(':nth-child(2)').text() || "",
      'Date': $(this.row).children(':nth-child(3)').text() || "",
      'Department': $(this.row).children(':nth-child(4)').text() || "",
      'Description': $(this.row).children(':nth-child(5)').text() || "",
    }

    return inputs;
  }

  /**
   * buildEBoard - Returns the inputs for am EBoard Table
   *
   * @return {Object}  A dictionary of columns and row values;
   */
  buildEBoard() {
    const inputs = {
      'ID': $(this.row).children(':nth-child(1)').text() || "",
      'Role': $(this.row).children(':nth-child(2)').text() || "",
      'Name': $(this.row).children(':nth-child(3)').text() || "",
    }

    return inputs;
  }
}


/**
 * Handles Displaying the Table Data.
 */
class TableLayouts {
  constructor(tableData) {
    this.tableData = tableData;
  }


  /**
   * parseTime - Converts Time format into a more readable format with am/pm.
   *
   * @param  {String} time SQL Time format.
   * @return {String}      Time in 12-hr format.
   */
  parseTime(timeStr) {
    timeStr = timeStr.split(':');
    var time;

    var timeString = "";

    function hourOverflow(hour) {
      hour = parseInt(hour);
      if (hour == 12) {
        time = 'pm';
      } else
      if (hour > 11) {
        hour -= 12;
        time = 'pm';
      } else {
        time = 'am';
      }
      return hour;
    }

    if (!(timeStr[1] == '00' && timeStr[0] == '00')) {
      timeString = `${hourOverflow(timeStr[0])}:${timeStr[1]} ${time}`;
    }

    return timeString;
  }


  /**
   * parseDateTime - Converts DateTime format into a more readable format.
   *
   * @param  {String} datetime SQL DateTime format.
   * @return {String}          Date Time in a more user friendly format.
   */
  parseDateTime(datetime) {
    const numToStr = {
      '01': "January",
      '02': "February",
      '03': "March",
      '04': "April",
      '05': "May",
      '06': "June",
      '07': "July",
      '08': "August",
      '09': "September",
      '10': "October",
      '11': "November",
      '12': "December",
    }

    var values = datetime.split(/\D/);
    const dateString = `${numToStr[values[1]]} ${values[2]}, ${values[0]} `;
    const timeString = this.parseTime(`${values[3]}:${values[4]}:${values[5]}`);
    return dateString + timeString;
  }


  /**
   * parseURL - Parses the domain out of the
   *
   * @return {type}  description
   */
  parseURL(url) {
    const urls = url.split(",");
    var hyperlink = "";
    for (var i in urls) {
      const segments = urls[i].match(/:\/\/(.[^\/]+)(.*)/);
      hyperlink += `<a class="url-link" href="${url}" target="_blank">${segments[1]}</a>`;
      if (i < (urls.length - 1)) {
        hyperlink += '<br>';
      }
    }
    return hyperlink;
  }

  /**
   * var getHeaders - Grabs the headers of the dictionary.
   *
   * @return {String} Table headers.
   */
  getHeaders() {
    const keys = Object.keys(this.tableData[0]);
    var html = "";
    for (var header in keys) {
      if (header == 0) {
        html += '<th style="display:none">' + keys[header] + '</th>';
      } else {
        html += '<th>' + keys[header] + '</th>';
      }
    }
    html = '<tr>' + html + '</tr>';
    return html;
  }

  /**
   * var getRows - Grabs the data from this.tableData rows.
   *
   * @return {String} HTML Table rows.
   */
  getRows() {
    const keys = Object.keys(this.tableData);
    var html = "";
    for (var header in keys) {
      var rowDict = this.tableData[keys[header]];
      var rowKeys = Object.keys(rowDict);
      var rowHTML = "";
      for (var headerRow in rowKeys) {
        var rowVal = rowDict[rowKeys[headerRow]];
        if (/[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{3}Z/.test(rowVal)) {
          rowVal = this.parseDateTime(rowVal);
        }
        if (/[0-9]{2}:[0-9]{2}:[0-9]{2}/.test(rowVal)) {
          rowVal = this.parseTime(rowVal);
        }
        if (/^http.*[a-z]{3}\/.*/.test(rowVal)) {
          rowVal = this.parseURL(rowVal);
        }
        if (rowVal == null) {
          rowVal = '<b>N/A</b>';
        }
        if (headerRow == 0) {
          rowHTML += '<td style="display:none">' + rowVal + '</td>';
        } else {
          rowHTML += '<td>' + rowVal + '</td>';
        }
      }
      html += '<tr>' + rowHTML + '</tr>';
    }

    return html;
  }

  /**
   * var updateTable - Populates the table with the information from the API
   * request.
   *
   * @return {void} Updates the table.
   */
  updateTable() {
    console.log("Updating Table with these values: ", this.tableData);
    const table = $('#response-table');
    var header = this.getHeaders();
    var rows = this.getRows();

    table.html(header + rows);

    // Add Event Handlers
    $('.url-link').click((event) => {
      event.stopPropagation();
    })
  }
}

/**
 * var updateHeight - Modifies the height of the elements to accomodate the
 * table data.
 *
 * @return {void}  Updates the value of the html heights.
 */
var updateHeight = function(height) {
  $('.data-table').height(height + 200);
}


/**
 * Parses the String of the Input to make a get request from the database.
 * Handles the event of clicking on a table row / data entry.
 * Sends both GET, POST, and UPDATE queries.
 */
class AnalyzeSearch {
  constructor(inputStr, table) {
    this.inputStr = inputStr;
    this.table = table;
  }


  /**
   * normalizeString - Normalizes the input String by organizing it into a dictionary.
   *
   * @return {Object}  A dictionary representing the ID, Data, and String values of the input.
   */
  normalizeString() {
    const splitStr = this.inputStr.split(" ");
    var id = null;
    var date = null;
    var string = [];
    for (var i = 0; i < splitStr.length; ++i) {
      // Check if it is a string
      if (isNaN(splitStr[i])) {
        // Check if date
        if (/[0-9]{2}:[0-9]{2}:[0-9]{2}/.test(splitStr[i])) {
          data = splitStr[i];
        } else {
          string.push(splitStr[i])
        }
      } else {
        id = parseInt(splitStr[i]) || null;
      }
    }
    return {
      'id': id,
      'date': date,
      'str': string
    };
  }

  /**
   * var convertToDict - Converts a JSON string into a dictionary structure.
   *
   * @param  {String} json  The JSON data recieved for the request.
   * @return {Object} A dictionary representation of the JSON object.
   */
  convertToDict(json) {
    var result = JSON.parse(json);
    var dict = {};
    for (var i = 0; i < result.length; i++) {
      if (isNaN(result[i])) {
        dict[i] = result[i];
      } else {
        dict[i] = parseInt(result[i]);
      }
    }
    return dict;
  }


  /**
   * dataFetch - Makes a request using the given URL and tasks the display of the
   * Data and handles the selection of the table rows / data entry.
   *
   * @param  {String} url The URL address to make a request from.
   * @return {void} Displays the requested data.
   */
  dataFetch(url) {
    fetch(url).then((res) => {
        if (res.ok && (res.status == 200)) {
          return res.json();
        }
        throw new Error('Network response failure.');
      })
      .then((myJson) => {
        var str = JSON.stringify(myJson[0]);
        var dict = this.convertToDict(str);
        return dict;
      })
      .then((ret) => {
        if (ret == {}) {
          console.error("No Data, Probably Chuck's Fault");
        }
        var layout = new TableLayouts(ret);
        layout.updateTable();
        $('.form-wrap').css('display', 'none');
        $('.table-wrap').css('display', 'block');
        updateHeight($('.table-wrap').height());
        $('.loading-bar').removeClass('color');



        $('#response-table tr').click(
          (event) => {
            var form = new FormControl(this.table, $(event['currentTarget']));
            form.displayForm();
            $('.table-wrap').css('display', 'none');
            $('.form-wrap').css('display', 'block');
            updateHeight($('.form-wrap').height());
          }
        );
      })
      .catch((e) => {
        $('.loading-bar').removeClass('color');
        alert("Data Fetch Error");
        console.log(e);
      });
  }


  /**
   * sendQuery - Builds a GET request created from the given input values.
   *
   * @param  {Object} dataInput A dictionary of the input values.
   * @return {void} The request gets handed over to another method to handle the response.
   */
  sendQuery(dataInput) {
    const tableURL = host + this.table.replace(" ", "_").toLowerCase();

    for (const [key, value] of Object.entries(dataInput)) {
      switch (key) {
        case 'id':
          if (value != null) {
            const idURL = tableURL + `/id/${value}`;
            console.log(idURL);
            console.log("Loading From ID: " + value);
            this.dataFetch(idURL);
            return;
          }
          break;
        case 'date':

          break;
        case 'str':
          if (value != [""]) {
              const str = dataInput['str'].join("%20");
              var nameURL = `${tableURL}/name/${str}`;
              console.log(nameURL);
              console.log("Loading from Name: " + value);
              this.dataFetch(nameURL);
              return;

          }
          break;
        default:
          continue;
      }
    }
    console.log(tableURL);
    console.log("No Inputs Given, Display All");
    this.dataFetch(tableURL);
  }


  /**
   * deleteEntry - Deletes the a table entry.
   *
   * @return {void}  Sends a delete request and resets the page to a default view.
   */
  deleteEntry() {
    var url = host + this.table + this.inputStr;
    console.log(url);
    fetch(url)
      .then((response) => {
        if (response.ok && (response.status == 200)) {
          $('.form-wrap').css('display', 'none');
          updateHeight(0);
          var anal = new AnalyzeSearch("", this.table);
          var s = anal.normalizeString();
          anal.sendQuery(s);
        } else {
          throw new Error('Network response failure.');
        }
      })
      .catch((e) => {
        alert("Deletion Failed");
        console.log("Deletion Failed: " + e);
      });
  }
}

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
 * Builds and displays the forms corresponding to a Table's columns.
 */
class FormControl {
  constructor(table, row) {
    this.table = table;
    this.row = row;
  }


  /**
   * displayForm - Determines what form Layout is needed to display the data.
   *
   * @return {void}  Sends the layout to another method to display it.
   */
  displayForm() {
    console.log(this.table, this.row);
    this.table = this.table.replace(" ", "_");
    var formInputs;
    const layout = new FormLayouts(this.row);
    switch (this.table) {
      case 'Location':
        formInputs = layout.buildLocation();
        this.table = 'location';
        break;
      case 'Live_Recording':
        formInputs = layout.buildLiveRecording();
        this.table = 'live_recording';
        break;
      case 'Club_Member':
        formInputs = layout.buildClubMember();
        this.table = 'club_member';
        break;
      case 'Artist':
        formInputs = layout.buildArtist();
        this.table = 'artist';
        break;
      case 'Release':
        formInputs = layout.buildRelease();
        this.table = 'release';
        break;
      case 'Project':
        formInputs = layout.buildProject();
        this.table = 'project';
        break;
        break;
      case 'Event':
        formInputs = layout.buildEvent();
        this.table = 'event';
        break;
      case 'Engineer':
        formInputs = layout.buildEngineer();
        this.table = 'engineer';
        break;
      case 'Contribution':
        formInputs = layout.buildContribution();
        this.table = 'contribution';
        break;
      case 'EBoard':
        formInputs = layout.buildEBoard();
        this.table = 'eboard_member';
        break;
      default:
        console.error("Table Error");
    }
    this.updateView(formInputs);
  }


  /**
   * updateView - Displays the data from the table entry.
   *
   * @param  {Object} formInputs A dictionary of the entry's columns and row values.
   * @return {void} Button selection either sends an update request or deletes it.
   */
  updateView(formInputs) {
    var html = `<input style=\'display:none\' type='text' name='table' value=\'${this.table}\'>`;
    const keys = Object.keys(formInputs);
    console.log("Values for the Form Layout: ", formInputs);
    for (var i in keys) {
      var key = keys[i];
      if (formInputs[key] == "N/A") {formInputs[key] = ''};
      if (key == 'ID') {
        html += `${key}<br>
      <input class=\'form-control text-input\' type=\'text\' value=\'${formInputs[key]}\' name=\'${key}\' readonly=\'readonly\'/><br>`;
      } else {
        html += `${key}<br>
      <input class=\'form-control text-input\' type=\'text\' value=\'${formInputs[key]}\' name=\'${key}\'><br>`;
      }
    }

    if (this.row == null) {
      html += "<input style=\'display:none\' type='text' name=\'transaction\' value='insert'>";
    } else {
      html += "<input style=\'display:none\' type='text' name=\'transaction\' value='update'>";
    }

    html += '<input type=\'submit\'><br>';
    html += '<input type=\'button\' value=\'Delete\' id=\'delete\'><br>';
    html += '<input type=\'button\' value=\'Back\' id=\'back\'>';

    const form = $('.form-wrap form');
    form.html(html);

    var t = this.table;

    $('#delete').click(function() {
      var deleteEntry = new AnalyzeSearch(`/delete/${formInputs['ID']}`, t);
      deleteEntry.deleteEntry();
    });

    $('#back').click(() => {
      $('.form-wrap').css('display', 'none');
      $('.table-wrap').css('display', 'block');
      updateHeight($('.table-wrap').height());
    })
  }
}


/**
 * Handles the input request.
 */
class InputControl {
  constructor() {
    this.input = $('.text-input').val();
    this.type = $('#type').text();
    this.table = $('#table').text();
  }

  /**
   * handleSubmission - Determines what request is being made and routes it through
   * the proper methods
   *
   * @return {void}  The result should consist of a view update.
   */
  handleSubmission() {
    if (table == 'Query' || table == 'Table') {
      console.error("No table selected.");
      return;
    }

    var str = this.input;
    if (this.type == "Search") {
      // Search for the table
      $('.loading-bar').addClass('color');
      var anal = new AnalyzeSearch(str, this.table);
      var s = anal.normalizeString();
      anal.sendQuery(s);
    } else {
      // Add an entry to the table
      const qtable = this.table.replace(" ", "_");
      var form = new FormControl(qtable, null);
      form.displayForm();
      $('.table-wrap').css('display', 'none');
      $('.form-wrap').css('display', 'block');
      updateHeight($('.form-wrap').height());
    }
  }
}

/**
 * body - The main control that listens for specific events occuring in the DOM.
 */
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

  // Dropdown events
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
      var temp = new AnalyzeSearch();
      temp.dataFetch(host + table.replace(" ", "_"));
      hideDrop($(this).parent());
    }
  )

  // Input Listener
  $('.text-input').keypress(function(event) {

    // Act if keypress is 'Enter'
    if (event.keyCode == 13 ) {
      event.preventDefault();
      var inputCtrl = new InputControl();
      inputCtrl.handleSubmission();
    }
  });
});
