$(function () {


var searchArtist = function (term) {
  $.ajax({
    type: 'GET',
    url: 'https://api.spotify.com/v1/search',
    data: {
        type: 'artist',
          q: term,

    },
    success: function (response) {
            $('#artists').empty()
          $.each(response.artists.items, function(key, value){
            var header = $('<li>').text(value.name);
            var image = $('<img>').attr('src',(value.images[0].url));
            image.attr('data-id',value.id)
            image.addClass('pictures')
            image.attr('data-toggle', "modal")
            image.attr('data-target', "#myModal")
            $('#artists').append(header);
            $('#artists').append(image);

          })
    },

    error: function (err) {
      console.log('in da error');
    }
  })
  }
  $('#search-form').submit(function(e){
    e.preventDefault()
    var searchTerm = $('#search').val()
    searchArtist(searchTerm)
    });




    $(document).on('click', ".pictures", function(e) {
      e.preventDefault()
      var searchTerm = $(e.currentTarget).attr('data-id')
      console.log(searchTerm)
      searchAlbum(searchTerm)
      });

      var searchAlbum = function (term) {
        $.ajax({
          type: 'GET',
          url: 'https://api.spotify.com/v1/artists/'+ term + '/albums',

          success: function (response) {
            console.log(response)
            $('.album').empty()
                $.each(response.items, function(key, value){
                  var header = $('<li>').text(value.name);
                  var image = $('<img>').attr('src',(value.images[0].url));

                  image.attr('album-id',value.id)
                  image.addClass('albums')
                  image.attr('data-toggle', "modal")
                  image.attr('data-target', "#myModal2")
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




      $(document).on('click', ".albums", function(e) {
        e.preventDefault()
        var searchTerm = $(e.currentTarget).attr('album-id')
        console.log(searchTerm)
        searchTitles(searchTerm)
        });

        var searchTitles = function (term) {
          $.ajax({
            type: 'GET',
            url: 'https://api.spotify.com/v1/albums/'+ term + '/tracks',

            success: function (response) {
              console.log(response)
              $('.title').empty()
                  $.each(response.items, function(key, value){
                    var list = $('<li>')
                    var header = $('<a target=”_blank” >').text(value.name);
                    header.attr('href', value.preview_url)
                    list.append(header)
                    $('.title').append(list);
                  })
                  $('#myModal').modal('hide')
                  $('#myModal').on('hidden', function () {
                  // Load up a new modal...
                  $('#myModal2').modal('show')
                })
                },
            error: function (err) {
              console.log('in da error');
            }

          })
        }



})
