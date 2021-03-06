require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }

  it("titleizes the name of a product") do
    product = Product.create({name: "meatball sandwich", cost: 8, country_of_origin: "United States"})
    expect(product.name()).to(eq("Meatball Sandwich"))
  end
end
