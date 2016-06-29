var words = [
    "dead",         // 1st -> d
    "bygone",       // 2nd -> y
    "landing",      // 3rd -> n
    "cheaply",      // 4th -> a
    "assumed",      // 5th -> m
    "incorrectly",  // 1st -> i
    "attention",    // 2nd -> t
    "agent"         // 3rd -> e
];



function decoder(array) {
  var index = 0;
  var secretMessage= '';

  for (var i = 0; i < array.length; i++) {
    secretMessage += array[i].charAt(index % 5);
    index++;
  }
  return secretMessage;
}

//alternative way

// function decoder(array) {
//   var index = 0;
//   var secretMessage= '';
// array.forEach(function(word,indexNew) {
//   secretMessage += word[indexNew % 5];
// })
//  return secretMessage
//  }

 // console.log(decoder(words));


 function super_decode(sentence, code) {
   var array = sentence.split(' ')
   var codearray = code.split('-')
   var evenodd = codearray[0];
   var direction = codearray[1];
   var index = 0;
   var secretMessage= '';
   if (direction == "backwards") {
     array = array.reverse();
   }
   if (evenodd == "even") {
   for (var i = 0; i < array.length; i++) {
     if (i % 2 == 0) {
     secretMessage += array[i].charAt(index % 5);
     index++;
      }
    }
  }
  else if (evenodd == "odd") {
  for (var i = 0; i < array.length; i++) {
    if (i % 2 == 0) {
    secretMessage += array[i].charAt(index % 5);
    index++;
     }
   }
 }
   return secretMessage;
 }





 var sentence, message;
 sentence = "fill the proper tank for the cow";
 message = super_decode(sentence, "even-backwards");
 console.log(message);
