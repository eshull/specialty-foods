require 'rails_helper'

describe "add a new product" do
#   it "adds and saves new product" do
#     visit products_path
#     click_link 'Add New Product'
#     fill_in 'Name', :with => 'Dragonfruit'
#     click_on 'Create Product'
#     expect(page).to have_content 'Products'
#   end
#
  it "gives error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end
end
