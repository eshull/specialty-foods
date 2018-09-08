class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :presence => true
  validates :cost, :presence => true
  validates :origin, :presence => true

  scope :sort_recent, -> {(
  select("products.id, products.name, products.cost, products.origin")
  .order("(products.created_at) DESC")
  )}

  scope :most_ratings, -> {(
  select("products.id, products.name, products.cost, products.origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}

  scope :highest_rating, ->{(
      select("products.id, products.name, products.origin, products.cost, count(reviews.rating) as reviews_rating")
      .joins(:reviews)
      .group("products.id")
      .order("reviews_rating DESC")
      .limit(1)
    )}

    scope :local_to_usa, -> {(
      where(origin: "USA")
      )}
end
