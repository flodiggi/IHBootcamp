

function caesarCipher (message, shift) {
  if (shift === undefined) {
    shift = -3;}
  var letters = message.split("");
  var shifted = [];
  letters.forEach(function(letter){
    //for uppercase:
    if (letter >= "A" && letter <= "Z")  {
        //endofalphabet
      if (letter.charCodeAt(0) >= (90 - shift + 1)) {
        shifted.push(String.fromCharCode(letter.charCodeAt(0) - 26 + shift))
      }
        //beginningalphabet
      else if (letter.charCodeAt(0) <= (65 - shift - 1)) {
        shifted.push(String.fromCharCode(letter.charCodeAt(0) + 26 + shift))
      } else {
        shifted.push(String.fromCharCode(letter.charCodeAt(0) + shift));
        }
    }
    //for lowercase:
    else if (letter >= "a" && letter <= "z") {
      //endofalphabet
    if (letter.charCodeAt(0) >= (122 - shift + 1)) {
      shifted.push(String.fromCharCode(letter.charCodeAt(0) - 26 + shift))
    }
      //beginningalphabet
    else if (letter.charCodeAt(0) <= (97 - shift - 1)) {
      shifted.push(String.fromCharCode(letter.charCodeAt(0) + 26 + shift))
    } else {
      shifted.push(String.fromCharCode(letter.charCodeAt(0) + shift));
      }
  }
    // ignore non-letters
    else {
    shifted.push(letter);
    }

  })
  return shifted.join("")
}



var encrypted = caesarCipher("haskell",5 );

console.log(encrypted);
