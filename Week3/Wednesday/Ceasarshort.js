var CaesarCipher = function (shift) {
  if (shift === undefined) {shift = -3;}
  this.encode = (str) => str.replace(/[a-z]/gi, (c) => String.fromCharCode((c.toUpperCase().charCodeAt(0) + shift - 65) % 26 + 65));}
var c = new CaesarCipher(5); // creates a CipherHelper with a shift of five
console.log(c.encode('Codewars')); // returns 'HTIJBFWX'
