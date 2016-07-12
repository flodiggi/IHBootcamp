


// my try
  // $.ajax({
  //   type: 'GET',
  //   url: 'https://ironhack-characters.herokuapp.com/characters',
  //   success: function (response) {
  //     console.log('in da success');
  //     console.log(response);
  //     var character1 = $('<div>').attr('name', response[0].name).text(response[0].name);
  //     var character2 = $('<div>').attr('name', response[1].name).text(response[1].name);
  //     $('.container').append(character1);
  //     $('.container').append(character2);
  //   },
  //   error: function (err) {
  //     console.log('in da error');
  //   }
  // })
  //
  //
  // $('form').submit(function(e){
  //   e.preventDefault()
  //   var newCharacter = {
  //     name: $('.name').val(),
  //     occupation: $('.occupation').val(),
  //     debt: $('.debt').val(),
  //     weapon: $('.weapon').val()
  //   }
  //    var request = $.post('https://ironhack-characters.herokuapp.com/characters', newCharacter);
  //
  // });


  ​//working but not nice:
  // $(function () {
  //   $.ajax({
  //     type: 'GET',
  //     url: 'http://ironhack-characters.herokuapp.com/characters',
  //     success: function (characters) {
  //       characters.forEach( function (character) {
  //         var listItem = $('<li>').text(character.name + ' is a ' + character.occupation + ' with ' + character.weapon);
  //         $('ul.characters').append(listItem);
  //       })
  //     },
  //     error: function (err) {
  //       console.log('in da error');
  //     }
  //   })
  // ​
  //   $('#new-character').on('submit', function (e) {
  //     e.preventDefault();
  //     var name = $('[name="name"]').val();
  //     var occupation = $('[name="occupation"]').val();
  //     var weapon = $('[name="weapon"]').val();
  //     var newCharacter = {
  //       name: name,
  //       occupation: occupation,
  //       weapon: weapon
  //     };
  //     $.ajax({
  //       type: 'POST',
  //       url: 'http://ironhack-characters.herokuapp.com/characters',
  //       data: newCharacter,
  //       success: function (response) {
  //         console.log('in da success');
  //         console.log(response);
  //       },
  //       error: function (err) {
  //         console.log('in da error');
  //       }
  //     })
  //   })
  // })


  //Nice

  $(function () {
​
  var CharacterController = function (container, formElement, url) {
    this.container = container;
    this.formElement = formElement;
    this.url = url;
    this.characters = [];
    this.setListeners();
  }
​
  CharacterController.prototype.fetchCharacters = function () {
    $.ajax({
      type: 'GET',
      url: this.url,
      success: this.save.bind(this),
      error: function (err) {
        console.log('in da error');
      }
    })
  }
​
  CharacterController.prototype.setListeners = function () {
    this.formElement.on('submit', this.saveCharacter.bind(this));
  }
​
  CharacterController.prototype.renderCharacter =
​
  CharacterController.prototype.render = function () {
    var that = this;
    this.characters.forEach(function (character) {
      var listItem = $('<li>').text(character.name + ' is a ' + character.occupation + ' with ' + character.weapon);
      that.container.append(listItem);
    })
  }
​
  CharacterController.prototype.save = function (characters) {
    this.characters = characters;
    this.render();
  }
​
  CharacterController.prototype.saveCharacter = function (e) {
    e.preventDefault();
    var newCharacter = {
      name: $('[name="name"]').val(),
      occupation: $('[name="occupation"]').val(),
      weapon: $('[name="weapon"]').val()
    };
    this.characters.push(newCharacter);
    $.ajax({
      type: 'POST',
      url: this.url,
      data: newCharacter,
      success: this.render.bind(this),
      error: function (err) {
        console.log('in da error');
      }
    })
  }
  var container = $('ul.characters');
  var formElement = $('#new-character');
  var url = 'http://ironhack-characters.herokuapp.com/characters';
  var controller = new CharacterController(container, formElement, url);
  controller.fetchCharacters();
})
