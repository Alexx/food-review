require 'rails_helper'

describe Review do
  it { should belong_to(:product) }
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body }
  it { should validate_presence_of :rating }
  it { should validate_length_of(:content_body).is_at_least(50) }
  it { should validate_length_of(:content_body).is_at_most(250) }

  it("titleizes the name of a product") do
    product = Product.create({name: "meatball sandwich", cost: 8, country_of_origin: "United States"})
    review = Review.create({author: "bill gates", content_body: "This is the best sandwich I have ever eaten, I would kiss a grizzly bear just to have another bite of one of these sandwichs!", rating: 5, product_id: product.id})
    expect(review.author()).to(eq("Bill Gates"))
  end
end
