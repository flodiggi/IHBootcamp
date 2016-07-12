// Write your Pizza Builder JavaScript in this file.
$('.btn').toggleClass("active")
$('.sauce').toggleClass("sauce-white")
$('.crust').toggleClass("crust-gluten-free")
$('.mushroom').toggle()
$('.pep').toggle()
$('.green-pepper').toggle()
$("li:contains('mushrooms')").toggle()
$("li:contains('pepperonni')").toggle()
$("li:contains('green peppers')").toggle()
$("li:contains('white sauce')").toggle()
$("li:contains('gluten-free crust')").toggle()




function Price () {
  var totalPrice = 10;
 if ($('.btn-pepperonni').hasClass('active'))
 {totalPrice += 1};
if ($('.btn-mushrooms').hasClass('active'))
 {totalPrice += 1};
if ($('.btn-green-peppers').hasClass('active'))
 {totalPrice += 1};
if ($('.btn-sauce').hasClass('active'))
 {totalPrice += 3};
if ($('.btn-crust').hasClass('active'))
 {totalPrice += 5};
 return totalPrice
}


$('strong').text("$ " + Price())





$(document).ready(function(){
    $(".btn-mushrooms").click(function(){
        $(".mushroom").toggle();
        $( ".btn-mushrooms" ).toggleClass( "active");
        $("li:contains('mushrooms')").toggle()
        $('strong').text("$ " + Price())
    });
});

$(document).ready(function(){
    $(".btn-pepperonni").click(function(){
        $(".pep").toggle();
        $( ".btn-pepperonni" ).toggleClass( "active");
        $("li:contains('pepperonni')").toggle()
        $('strong').text("$ " + Price())
    });
});

$(document).ready(function(){
    $(".btn-green-peppers").click(function(){
        $(".green-pepper").toggle();
        $( ".btn-green-peppers" ).toggleClass( "active");
        $("li:contains('green peppers')").toggle()
        $('strong').text("$ " + Price())
    });
});

$(document).ready(function(){
    $(".btn-sauce").click(function(){
        $( ".sauce" ).toggleClass( "sauce-white");
        $( ".btn-sauce" ).toggleClass( "active");
        $("li:contains('white sauce')").toggle()
        $('strong').text("$ " + Price())
    });
});


$(document).ready(function(){
    $(".btn-crust").click(function(){
        $(".crust").toggleClass("crust-gluten-free");
        $( ".btn-crust" ).toggleClass( "active");
        $("li:contains('gluten-free crust')").toggle()
        $('strong').text("$ " + Price())
    });
});
