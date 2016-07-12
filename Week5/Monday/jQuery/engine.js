var phrases = [
  'Soichiro LOOOOOOOOVVVVESSS Pikachu',
  'Soichiro drinks too much',
  'Soichiro is a coding genius',
  'Soichiro aka el Ironhacker',
  'Some people call Soichiro the creator of the soy souce',
]



$(document).ready(function(){
  var b= '<input type="button" class="remove" value="X"/>'

  $(".change").click(function(){
  var number = Math.floor(Math.random() * phrases.length)
  var text = phrases[number]
  $('h1').text(text)
  })
  $('form').submit(function(e){
    e.preventDefault()
    phrases.push($(e.currentTarget).find("input").val())
    var sentence = $('<li>');
    sentence.addClass('sentence');
    $('ul').append(sentence.text($(e.currentTarget).find("input").val()))
    sentence.append(b)

  });





  $('ul').toggle()

  $(".show").click(function(){
  $(".show").toggleClass("hide");
  $('ul').toggle()
  if ($('.show').hasClass('hide'))
  {$('.show').text("Hide Phrases")};
  if (!$('.show').hasClass('hide'))
  {$('.show').text("Show Phrases")};

  })





  $.each(phrases,function(i){
    var sentence = $('<li>');
    sentence.addClass('sentence');
    sentence.text(phrases[i]);
    sentence.append(b)
    $('ul').append(sentence);
    // $(".remove").click(function(){
    //    $(this).parent('li').remove();
    //    phrases.splice(i, 1);
    // });
  })



})


$(document).on("click", ".remove", function(){
   $(this).closest('li').remove();
   var index = $(this).attr('data-id');
          phrases.splice(index,1);

});
