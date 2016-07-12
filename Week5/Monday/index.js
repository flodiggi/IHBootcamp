

$('form').on('submit',function(){
  var empty = true;
          if ($('form') != '') {
              empty = false;
          }


})



$(document).ready(function () {
  console.log('hello');
  var max = 1;
  for (var i = 0; i < max; i++) {
    var cell = $('<div>');
    cell.addClass('cell blue');
    $('.container').append(cell);
  }
​
  $('.cell').on('click', function(e) {
    console.log('you clicked a button!');
    console.log(e.currentTarget);
  });
​
  $(document).on('keypress', function(e) {
    console.log('you pressed a key!');
    console.log(e.keyCode);
  });
});
​
console.log('bye');
​
​
// setTimeout(function () {
//   var cells = $('.cell');
//   cells.each( function(index, element) {
//     $(element).toggleClass('blue red');
//   })
// }, 3000);
​
/*
  $()
  - Select elements:
    Ex: $('.my-class') using CSS selectors
    Ex: $(domElement) using raw DOM elements
      $('.cell').each( function (index, element) {
        // element is not a jQuery object, but a raw DOM element
        var el = $(element) => now 'el' is a jQuery Object
      })
    Return value is a jQuery object
  - Create elements:
    Ex: $('<div>') using '<' '>' characters to create tags
    Return value is a jQuery object
​
  Methods to add elements to the DOM: .append, .prepend
  Methods to change tag text: .text, .html
  Methods to remove elements: .remove, .empty
  Methods to manage attributes: .attr, .hasClass, .addClass
  Method to iterate: .each( function (index, element) {})
*/
