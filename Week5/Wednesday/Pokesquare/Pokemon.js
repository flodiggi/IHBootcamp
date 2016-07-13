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



// var PokemonController = function (image) {
//   this.image = image;
//   this.attachPokemon(image)
//
// }


$(document).on('click', ".blue", function(e) {
  e.preventDefault()
  var target = $(e.currentTarget)
  target.removeClass("blue").addClass("red");
  var number = Math.floor(Math.random() * 100) + 1
  searchPokemon(number, target)

  });



var searchPokemon = function (number, target) {
  $.ajax({
    type: 'GET',
    url: 'http://pokeapi.co/api/v2/pokemon-form/'+number+'/',
    success: function (response) {
      console.log(response)
      var image = $('<img>').attr('src',(response.sprites.front_default));
      image.addClass('pokemon')
      target.append(image);
    }
  })
}




// PokemonController.prototype.attachPokemon = function (image) {










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
