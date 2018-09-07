class Review < ActiveRecord::Base
  belongs_to :product
  validates :author, :presence => true

  scope(:highest_rating, ->do
      select("products.id, products.name, products.origin, products.reviews.rating")
      where({:rating => 5})
      .limit(1)
    end)

end
