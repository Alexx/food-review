class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}

  scope :most_reviews, -> {(
      select("products.id, products.name, products.cost, products.country_of_origin, count(reviews.id) as tasks_count")
      .joins(:reviews)
      .group("products.id")
      .order("reviews_count DESC")
      .limit(10)
      )}

  before_save(:titleize_product)

  private
    def titleize_product
      self.name = self.name.titleize
    end
end
