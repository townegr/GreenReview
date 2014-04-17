module RatingsHelper
  def rating(user, value, product)
    user_rating_id = product.ratings.where(user: user).take.id || ''
    star_id = "product_#{product.id}_#{value}"

    content_tag(:a, "",
      class: 'fa fa-star-o star',
      id: star_id,
      value: value,
      data: {
        product_id: product.id,
        user_rating_id: user_rating_id
        }
      )
  end
end
