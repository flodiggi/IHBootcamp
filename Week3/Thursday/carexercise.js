var Car = function(model, noise) {
  this.model = model
  this.noise = noise
}

Car.prototype.makenoise =
function(){console.log('This ' + this.model + ' makes ' + this.noise + ' and has ' + this.wheels + ' wheels')}

Car.prototype.wheels = 4

var audi = new Car('Audi', 'Bruuuuum');

audi.makenoise()
