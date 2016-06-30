
// sleep(5)
//
// function sleep(time) {
//   var seconds = time * 1000;
//   setTimeout(function(){
//     console.log('It\'s been 10 seconds.');}, seconds)
// }



function blastoff(time) {
  var counter = 1000;

function start(time) {

if (counter >= 1) {
  console.log(counter);
  counter--;
  setTimeout(start, 10);
}  else {
  console.log('Blastoff!!!!!!!!!')
  }
}
  start();
}



blastoff(10)
