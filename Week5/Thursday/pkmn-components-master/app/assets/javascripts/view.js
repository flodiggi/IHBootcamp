(function () {
  if (typeof window.PokemonApp === 'undefined') {
    window.PokemonApp = {};
  }
  
  var PokemonView = PokemonApp.PokemonView = function (model) {
    this.model = model;
  };

  PokemonView.prototype.render = function () {
    $('.js-pokemon-name').text(this.model.name);
    $('.js-pokemon-id').text('#' + this.model.national_id);
    $('.js-pokemon-height').text(this.model.height);
    $('.js-pokemon-weight').text(this.model.weight);
    $('.modal').modal('show');
  }
})()
