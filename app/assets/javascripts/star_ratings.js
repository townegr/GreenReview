$(function() {
   $('.rating_star').click(function() {
     var starClicked = $(this);
     var stars = starClicked.attr('data-stars');
     var productId = starClicked.attr('data-chapstick-id');

     starClicked.addClass('activated');

   });
 });
