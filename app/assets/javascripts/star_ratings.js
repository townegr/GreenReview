$(function() {
   $('.rating_star').click(function() {
     var starClicked = $(this);
     var stars = starClicked.attr('data-stars');
     var productId = starClicked.attr('data-chapstick-id');

     for(i = 1; i <= stars; i++){
      star = $('#product_'+ productId + '' + i);
      star.AddClass('activated');
     }

   });
 });
