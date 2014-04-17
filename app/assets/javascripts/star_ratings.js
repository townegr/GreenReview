$(function() {
   $('.rating_star').click(function() {
     var starClicked = $(this);
     var stars = starClicked.attr('value');
     var productId = starClicked.attr('data-chapstick-id');

     for(i = 1; i <= 5; i++){
      star = $('#product_'+ productId + '' + i);
      if (i <= stars){
        star.AddClass('activated');
      }else{
        star.removeClass('activated');
      }
    }

    $.ajax({
       type: 'POST',
       url: '/ratings',
       data: {
         rating: {
           // user_id: can't actually pass this in
           product_id: productId,
           stars: stars
         }
       }
     });
   });
 });
