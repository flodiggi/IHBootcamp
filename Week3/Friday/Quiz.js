var read = require('read');
var pry = require('pryjs');
var totalpoints = 0
var counter = -1


var Question = function (text, answer, id) {
  this.text = text
  this.answer = answer
  this.id = id

}

var questions = [
new Question('What\'s the capital of Belarus?', 'MINSK', 1),
new Question('You are taking part in a race, which position are you in, if you overtake the 2nd place? (type in a number)', '2', 2),
new Question('Complete the sequence: 3, 4, 6, 10, 18, _ ','34', 3),
new Question('What word becomes shorter when you add two letters to it?', 'short', '4'),
new Question('How many months have 28 days?', '12' , 5)]

var Quiz = function () {
  counter += 1
    return options = {
        prompt: questions[counter].text
      }


}

// Our options object, the prompt is simply what will appear in the command line when read is called
function start() {
return  read(Quiz(), evaluateAnswer)
}
// The prompt itself, passing options, and using our callback function after input

function evaluateAnswer (err, result){
  if (counter - 2 === questions.length) {
    console.log('the quiz is over');
  }
  else {
  if (result.toUpperCase() === questions[counter].answer) {
      totalpoints += 1
    }
    else {
      totalpoints -= 1
    }
  console.log(totalpoints);
  start()
}

}
start()
// Outputs whatever the user has entered back to the console
