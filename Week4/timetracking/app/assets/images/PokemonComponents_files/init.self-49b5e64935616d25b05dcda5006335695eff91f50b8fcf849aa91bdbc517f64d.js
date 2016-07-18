console.log("in da init")




$(document).on('click', ".js-show-pokemon", function(e) {
  e.preventDefault()
  var search = $(e.currentTarget).attr('data-pokemon-uri')
  $.ajax({
    type: 'GET',
    url: search,
    success: function (response) {
      console.log(response)
      var height = response.height
      var weight = response.weight
      $('.dl-horizontal:lt( 2 )').text(height)
      $('.dl-horizontal:lt( 4 )').text(weight)
    }
  })




$('.modal').modal('show')


})
