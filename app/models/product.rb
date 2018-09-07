class Product < ActiveRecord::Base
  has_many :reviews

  scope :sort_recent, -> {(
  select("products.id, products.name, products.origin")
  .order("lower(products.created_at) ASC")
  )}

  scope :most_ratings, -> {(
  select("products.id, products.name, products.cost, products.origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}
end
