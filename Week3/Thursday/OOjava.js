


// var person = {
// }
//
// var person2 = new Object()
//
// person['name'] = 'Thor'
//
// person2.name = 'Matias'
//
// person.sayHi = function(){console.log('Hi, my name is ' + this.name)}
//
// person.sayHi();



// var Person = function(name) {
//   this.name = name
// }
//
// Person.prototype.sayHi =
// function(){console.log('Hi I\'m ' + this.name)}
//
//
// var thor = new Person('Thor');
// var matias = new Person('Matias');
// thor.sayHi();
//
// console.log(Object.keys(thor))
// // console.log(thor.constructor.prototype)
//
// for(var property in thor) {
//   console.log(property);
// }




// var Person = function(name) {
//   this.name = name
// }
//
// Person.prototype.sayHi =
// function(){console.log('Hi I\'m ' + this.name)}
//
//
// var thor = new Person('Thor');
// var matias = new Person('Matias');
//
//
// var TA = function(name){
//   Person.call(this, name);
// }
//
// TA.prototype = new Person();
//
// var matias = new TA('Matias');
//
// matias.sayHi();



// var x = {
//   name: 'matias',
//   printName: function(){
//     console.log(this.name)
//   }
// }
//
// // x.printName();
//
// var f = x.printName
// f.bind(x)();

function thisIsACallback() {
  console.log('hi')
}

function highOrderFunction(callback){
  callback()
}

highOrderFunction(thisIsACallback);
