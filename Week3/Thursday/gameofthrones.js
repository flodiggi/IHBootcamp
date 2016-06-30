

var fs = require('fs');
function fileActions(err, file){
    if (err) {
        throw err;
    }
    var episodes = JSON.parse(file);
    processFile(episodes);

}


function processFile(episodes) {

  var list = [];
  list.push(episodes);


  var newList = episodes.sort(function(a, b){
  return a.episode_number - b.episode_number;
  });

  function filterEpisodes(newList){
    newList = episodes.filter(function(episode){
      return episode.rating >  8.5;
    })
    return newList
  }

  newList = filterEpisodes(episodes);

  function displayEpisodes(episodes){
  for(var episode in episodes){
    stars =[]
    for (var i = 0; i < episodes[episode].rating; i++) {
      stars.push('*')
    }
    console.log('Title: ' + episodes[episode].title);
    console.log(episodes[episode].description);
    console.log('Rating: ' + episodes[episode].rating + ' ' +stars.join(""));}}


  displayEpisodes(newList)

}


fs.readFile("./GoTEpisodes.json", 'utf8', fileActions);
