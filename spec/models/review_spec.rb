require 'rails_helper'

describe Review do
  it { should belong_to(:product) }
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body }
  it { should validate_presence_of :rating }

  it("titleizes the name of a product") do
    product = Product.create({name: "meatball sandwich", cost: 8, country_of_origin: "United States"})
    review = Review.create({author: "bill gates", content_body: "This is the best sub I have ever eaten", rating: 5, product_id: product.id})
    expect(review.author()).to(eq("Bill Gates"))
  end
end
