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

// Query Data
class QueryData {
  constructor(trans, table, query) {

  }
}




// Runtime functionality
$('body').ready(function() {

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
      console.log(t);
      var g = $(this).parent().parent();
      $(g).children('.dropdown-toggle').text(t);
      hideDrop($(this).parent());
    }
  )

  // Input Listener
  $('body').keypress(function(event) {
    if (event.keyCode == 13) {
      var str = $('.text-input').val();
      console.log(str);
      if (str.length > 0) {
        event.preventDefault();
        console.log("Enter");
      } else {
        console.log("No input");
      }
    }
  })
});
