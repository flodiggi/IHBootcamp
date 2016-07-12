
$(function(){


var max = 10;
for (var i = 0; i < max; i++) {
  var cell = $('<div>');
  cell.addClass('cell blue');
  $('.container').append(cell);
}
})










setInterval(function(){
  var cells = $('.cell');
  cells.each(function (index,element) {
    var number = Math.floor(Math.random() * 2) + 1
    if (number == 1) {
       $(element).removeClass("blue").addClass("red");
       }
       else {
       $(element).removeClass("red").addClass("blue");}
  })
}, 1000);



// var cells = $('.cell');
// var number = Math.floor(Math.random() * 2) + 1
// cells.each(function (index,element) {
//   if (number == 2) {
//     $(el).removeClass("blue").addClass("red");
//     }
//     else {
//     $(el).removeClass("red").addClass("blue");
// })


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
