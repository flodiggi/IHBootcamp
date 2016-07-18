(function () {
  window.PokemonApp = window.PokemonApp || {};

  var PokemonModel = PokemonApp.PokemonModel = function (url) {
    this.url = url
  }
  
  PokemonModel.prototype.fetch = function (anything) {
    // 'anything' is the function passed when fetch is called: 'view.render'
    // the function will be called -funcion style- on success
    var model = this;
    $.ajax({
      url: this.url,
      success: function (pokemonData) {
        model.name = pokemonData.name;
        model.national_id = pokemonData.national_id;
        model.height = pokemonData.height;
        model.weight = pokemonData.weight;
        anything(); // call of 'view.render' function style
      },
      error: function () {
        console.log('in da error');
      }
    })
  }
})()
