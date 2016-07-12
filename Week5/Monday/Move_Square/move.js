var Keys = {
        up: false,
        down: false,
        left: false,
        right: false
    };

var currentRow = 0
var currentCol = 0



$(function(){

var numCols = 10;
var numRows = 10;
  for (var i = 0; i < numRows; i++) {
    for (var j = 0; j < numCols; j++){
      var cell = $('<div>');
      cell.addClass('cell blue');
      cell.attr("row", i);
      cell.attr("col", j);
      $('.container').append(cell);
    }
  }
})

$(document).on('keypress', function(e) {
    if (e.keyCode == 100) {
      currentCol += 1}
    else if (e.keyCode == 97) {
      currentCol -= 1}
    else if (e.keyCode == 115) {
      currentRow += 1}
    else if (e.keyCode == 119) {
      currentRow -= 1}

      $(function(){
        var cells = $('.cell');
        cells.each(function (index,element) {
          if ($(element).attr('row') == currentRow && $(element).attr('col') == currentCol) {
             $(element).removeClass("blue").addClass("red");
             }
             else {
               $(element).removeClass("red").addClass("blue");
             }
        })
      })
  });
