require 'rails_helper'

describe "the add a product and review process" do
  FactoryBot.create(:user)
  it "adds a new product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'Burrito'
    fill_in 'Cost', :with => 6
    fill_in 'Country of origin', :with => 'Mexico'
    click_on 'Create Product'
    expect(page).to have_content 'Burrito'
  end

  it "gives error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end

end
