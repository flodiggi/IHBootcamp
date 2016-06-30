var colors = require('colors');
var vikings = []
var fighters = []
var saxons = []
var weapons = ['axe', 'spear', 'bow', 'shield']
//define Viking:
var Viking = function(name, health, strength, age, weapon) {
  this.name = name
  this.health = health
  this.strength = strength
  this.age = age
  this.weapon = weapon
}

Viking.prototype.makenoise =
function(){console.log(this.name + ' makes ' + 'Roaaaar'.grey)}
//define Saxons:
var Saxon = function() {
  this.name = 'A saxon'
  this.health = Math.floor(Math.random() * 21) + 10
  this.strength = Math.floor(Math.random() * 6) + 1
}
//create Saxons:
function newsaxons(number) {
  for (var i = 0; i < number; i++) {
    saxons.push(new Saxon)
  }
}

//start battle --> creates fight * x
function battle() {
  var counter = 0;
  var battlelength = Math.floor(Math.random() * 4) + 5
  var deadsaxons = 0
  var deadvikings = 0
  var totalsaxons = saxons.length
  var totalvikings = fighters.length

  console.log(battlelength);
  function startbattle() {
    //delete dead vikings
    fighters.forEach(function (viking1) {
      if (viking1.health <= 0) {
        deadvikings++;}
      fighters = fighters.filter(function(viking1){return viking1.health > 0;});
    })
    //delete dead saxons
    saxons.forEach(function (sax1, index1) {
      if (sax1.health <= 0) {
        deadsaxons++;}
      saxons = saxons.filter(function(sax1){return sax1.health > 0;});
    })

    var viking = randomChoice(fighters);
    var sax = randomChoice(saxons);
    if (counter < battlelength) {
      counter++;
      console.log('Fight Nr. ' + counter);
      console.log('The fight between '.green + viking.name.yellow + ' and '.green + sax.name.grey +  ' is starting'.green);
        fight(viking, sax);
        setTimeout(startbattle, 3000)
    }
    else {
      var percV = (deadvikings/totalvikings)*100;
      var percS = (deadsaxons/totalsaxons)*100;
      console.log('There are ' + deadsaxons + ' dead saxons and ' + deadvikings + ' dead vikings.' );
      console.log(percS + '% of Saxons are dead, ' + percV + '% of Vikings are dead' );
      if (percS > percV) {
        console.log('The Vikings have won the battle!!'.blue);
      }
      else { console.log('The Saxons have won the battle!!'.blue);
      }
    }
  }
  startbattle()
  }



function fight(fighter1, fighter2) {
    var life = 1;

function start() {
  if ((fighter1.health <= 0 || fighter2.health <= 0 ) ) {
    life = 0
  } //randomize punches/attack:
    if (life === 1) {var turn = 0; var rand = Math.random();
      if (rand > 0.5) {turn = 1}
      else {turn = 2};
      if (turn === 1) {
        console.log(fighter1.name +' strikes '+ fighter2.name + ' with an attack of ' + fighter1.strength);
        fighter2.health = fighter2.health - fighter1.strength
        console.log(fighter2.name + '\'s health is now at '+fighter2.health + '')}
      else {
        console.log(fighter2.name +' strikes '+ fighter1.name + ' with an attack of ' + fighter2.strength);
        fighter1.health = fighter1.health - fighter2.strength
        console.log(fighter1.name + '\'s health is now at '+fighter1.health + '')}
        setTimeout(start, 100);}
    else {
    console.log('The fight between '.red + fighter1.name.yellow + ' and '.red + fighter2.name.grey +  ' is over!!!!'.red);
  }
  }
  start();
  }

  //choose fight participants:
  function randomChoice(fighters) {
      return fighters[Math.floor(fighters.length * Math.random())];
  }

  // choose viking army:
  function chooseFighters() {
      vikings.forEach(function(viking){
      if (viking.age >= 15 && viking.age <= 45) {
      fighters.push(viking);}
    })
  }
  // boost attributes with random weapon
  function getWeapon() {
    fighters.forEach(function(viking){
      viking.weapon = weapons[Math.floor(Math.random() * 3) + 1]
      if (viking.weapon === 'axe' || viking.weapon === 'spear') { viking.strength += 1}
      else if (viking.weapon === 'bow') {viking.strength += 2}
      else if (viking.weapon === 'shield') {viking.health += 5}
    })
  }


var thor = new Viking ('Thor', 20, 8, 40, '')
var ragnar = new Viking ('Ragnar', 40, 10, 41,'')
var magnus = new Viking ('Magnus', 30, 8, 18,'')
var ivar = new Viking ('Ivar', 20, 5, 20,'')
var erik = new Viking ('Erik', 50, 9, 25,'')
var askold = new Viking ('Askold', 40, 7, 30,'')
var tooyoung = new Viking ('Wicky', 40, 7, 12,'')

vikings.push(thor)
vikings.push(ragnar)
vikings.push(magnus)
vikings.push(ivar)
vikings.push(erik)
vikings.push(askold)

//we found the Saxons..
newsaxons(20)
// let's fight...
chooseFighters()
getWeapon()
fighters.forEach(function (viking) {
viking.makenoise()})
battle()
