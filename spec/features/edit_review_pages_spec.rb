require 'rails_helper'

describe "the edit a review process" do
  it "edits a review" do
    product = Product.create(:name => 'Fruit', :id => 1)
    review = Review.create(:author => 'Frank', :content => 'it is good', :product_id => product.id)
    visit product_path(product)
    click_on 'Edit'
    fill_in 'author', :with => 'John'
    click_on 'Update Review'
    expect(page).to have_content 'John'
  end

  it "gives error when no description is entered" do
    product = Product.create(:name => 'another fruit')
    review = Review.create(:author => 'Jimmy', :product_id => product.id)
    visit product_path(product)
    click_on 'Edit'
    fill_in 'author', :with => ''
    click_button 'Update Review'
    expect(page).to have_content 'errors'
  end
end
