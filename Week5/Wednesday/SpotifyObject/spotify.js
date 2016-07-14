$(function () {


  var SpotifyController = function (url, searchform, header, image) {
    this.url = url
    this.searchform = searchform
    this.header = header
    this.image = image
    this.setListeners();
  }



  SpotifyController.prototype.setListeners = function () {
    var controller  = this;
    this.searchform.submit(function(e){
      e.preventDefault()
      var searchTerm = $('#search').val()
      controller.searchArtist(searchTerm)
      });
  }


  SpotifyController.prototype.searchArtist = function(term)  {
    $.ajax({
      type: 'GET',
      url: this.url,
      data: {type: 'artist', q: term},
      success: this.getArtists.bind(this),
        error: function (err) {
                    console.log('in da error');
                  }
    })
  }

  SpotifyController.prototype.getArtists = function (response) {
    $('#artists').empty()
    console.log(response)
    $.each(response.artists.items, function(key, value){
      var header = $('<li>').text(value.name);
      if (value.images[0]) {
             var imageURL = value.images[0].url;
           } else {
             var imageURL = 'http://images.clipartpanda.com/musician-clipart-5c52464f3932c4ac9efc15748089d666.jpg'
           }
      var image = $('<img>').attr('src',imageURL);
      var popularity = $('<div>').text('Popularity: '+value.popularity + '/100');
      header.addClass('header')
      popularity.addClass('popularity')
      image.attr('data-id',value.id)
      image.addClass('pictures')
      image.attr('data-toggle', "modal")
      image.attr('data-target', "#myModal")
      $('.Intro').text('Click images to display albums');
      $('#artists').append(header);
      $('#artists').append(image);
      $('#artists').append(popularity);
    })
    this.clickArtist()

  }

  SpotifyController.prototype.clickArtist = function () {
    var that = this
    $(document).on('click', ".pictures", function(e) {
      e.preventDefault()
      this.searchTerm = $(e.currentTarget).attr('data-id')
      console.log(this.searchTerm)
      that.searchAlbum(this.searchTerm)
    });

  }


  SpotifyController.prototype.searchAlbum = function (term) {
          $.ajax({
            type: 'GET',
            url: 'https://api.spotify.com/v1/artists/'+ term + '/albums',

            success: function (response) {
              console.log(response)
              $('.album').empty()
                  $.each(response.items, function(key, value){
                    var header = $('<li>').text(value.name);
                    var image = $('<img>').attr('src',(value.images[0].url));
                    header.addClass('headerAlbums')
                    image.attr('album-id',value.id)
                    image.addClass('albums')
                    image.attr('data-toggle', "modal")
                    image.attr('data-target', "#myModal2")
                    $('.Intro').empty()
                    $('.Intro').text('Click images to display tracklist');
                    $('.album').append(header);
                    $('.album').append(image);
                  })
                  $('#myModal').on('shown.bs.modal', function () {
                    $('#myInput').focus()
                  })
                },
            error: function (err) {
              console.log('in da error');
            }
          })
        }















controller = new SpotifyController('https://api.spotify.com/v1/search', $('#search-form'),$('<li>'),$('<img>'))
})






// var searchArtist = function (term) {
//   $.ajax({
//     type: 'GET',
//     url: 'https://api.spotify.com/v1/search',
//     data: {
//         type: 'artist',
//           q: term,
//     },
//     success: function (response) {
//             $('#artists').empty()
//               console.log(response)
//           $.each(response.artists.items, function(key, value){
//             var header = $('<li>').text(value.name);
//             var image = $('<img>').attr('src',(value.images[0].url));
//             var popularity = $('<div>').text('Popularity: '+value.popularity + '/100');
//             header.addClass('header')
//             popularity.addClass('popularity')
//             image.attr('data-id',value.id)
//             image.addClass('pictures')
//             image.attr('data-toggle', "modal")
//             image.attr('data-target', "#myModal")
//             $('.Intro').text('Click images to display albums');
//             $('#artists').append(header);
//             $('#artists').append(image);
//             $('#artists').append(popularity);
//
//           })
//     },
//
//     error: function (err) {
//       console.log('in da error');
//     }
//   })
//   }
//   $('#search-form').submit(function(e){
//     e.preventDefault()
//     var searchTerm = $('#search').val()
//     searchArtist(searchTerm)
//     });
//
//
//
//
//     $(document).on('click', ".pictures", function(e) {
//       e.preventDefault()
//       var searchTerm = $(e.currentTarget).attr('data-id')
//       console.log(searchTerm)
//       searchAlbum(searchTerm)
//       });
//
//       var searchAlbum = function (term) {
//         $.ajax({
//           type: 'GET',
//           url: 'https://api.spotify.com/v1/artists/'+ term + '/albums',
//
//           success: function (response) {
//             console.log(response)
//             $('.album').empty()
//                 $.each(response.items, function(key, value){
//                   var header = $('<li>').text(value.name);
//                   var image = $('<img>').attr('src',(value.images[0].url));
//                   header.addClass('headerAlbums')
//                   image.attr('album-id',value.id)
//                   image.addClass('albums')
//                   image.attr('data-toggle', "modal")
//                   image.attr('data-target', "#myModal2")
//                   $('.Intro').empty()
//                   $('.Intro').text('Click images to display tracklist');
//                   $('.album').append(header);
//                   $('.album').append(image);
//                 })
//                 $('#myModal').on('shown.bs.modal', function () {
//                   $('#myInput').focus()
//                 })
//               },
//           error: function (err) {
//             console.log('in da error');
//           }
//         })
//       }
//
//
//
//
//       $(document).on('click', ".albums", function(e) {
//         e.preventDefault()
//         var searchTerm = $(e.currentTarget).attr('album-id')
//         console.log(searchTerm)
//         searchTitles(searchTerm)
//         });
//
//         var searchTitles = function (term) {
//           $.ajax({
//             type: 'GET',
//             url: 'https://api.spotify.com/v1/albums/'+ term + '/tracks',
//
//             success: function (response) {
//               console.log(response)
//               $('.title').empty()
//                   $.each(response.items, function(key, value){
//                     var list = $('<li>')
//                     var header = $('<a target=”_blank” >').text(value.name);
//                     header.attr('href', value.preview_url)
//                     list.append(header)
//                     list.addClass('headerTitles')
//                     $('.Intro').empty()
//                     $('.Intro').text('Click track to play demo');
//                     $('.title').append(list);
//                   })
//                   $('#myModal').modal('hide')
//                   $('#myModal').on('hidden', function () {
//                   // Load up a new modal...
//                   $('#myModal2').modal('show')
//                 })
//                 },
//             error: function (err) {
//               console.log('in da error');
//             }
//           })
//         }
//
//
//
// })
