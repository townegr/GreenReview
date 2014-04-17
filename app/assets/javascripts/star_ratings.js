$(function() {
// $('.rating_star').click(function() {
  //   var starClicked = $(this);
  //   var stars = starClicked.attr('value');
  //   var productId = starClicked.attr('data-product-id');

  //   for(i = 1; i <= 5; i++) {
  //     star = $('#product_' + productId + '_' + i);
  //     if (i <= stars) {
  //       star.addClass('activated');
  //     } else {
  //       star.removeClass('activated');
  //     }
  //   }
});

var rates = function(isNew) {
  var star = $(window.event.srcElement);
  var productId = star.attr('data-product-id');
  var ratingData = {
    product_id: productId,
    stars: star.attr('value')
  };

  if (isNew === "") {
    requestType = "POST";
    path = "/ratings";
  } else {
    requestType = "PUT";
    path = "/ratings/" + productId;
  }

  submitVote(requestType, path, ratingData);
};

var submitVote = function(requestType, path, data) {
  $.ajax(
  {
    type: requestType,
    url: path,
    data: {
      rating: data
    }
  });
};
