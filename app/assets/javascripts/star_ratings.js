$(function() {
  $('.star').click( function(e) {
    var starClicked  = $(e.target);
    var numStars     = starClicked.attr('value');
    var productId  = starClicked.attr('data-product-id');
    var userRatingId = starClicked.attr('data-user-rating-id');
    var ratingData   = {
      product_id: productId,
      stars: numStars
    };

    if ( userRatingId === "") {
      requestType = "POST";
      path = "/ratings";
    } else {
      requestType = "PUT";
      path = "/ratings/" + productId;
    }

    highlightStars(numStars, productId);
    submitVote(requestType, path, ratingData);
  });
});

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

var highlightStars = function(stars, productId) {
  for(i = 1; i <= 5; i++) {
    star = $('#product_' + productId + '_' + i);
    if (i <= stars) {
      star.addClass('fa-star');
      star.removeClass('fa-star-o');
    } else {
      star.addClass('fa-star-o');
      star.removeClass('fa-star');
    }
  }
};
