require 'rails_helper'

describe "the edit a review process" do
  it "edits a review" do
    product = Product.create(:name => 'Fruit', :cost => 5, :origin => "mexico")
    review = Review.create(:author => 'Frank', :content => 'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr', :rating => 4, :product_id => product.id)
    visit product_path(product)

    click_on 'Edit'
    fill_in 'Author', :with => 'John'
    click_on 'Update Review'
    expect(page).to have_content 'John'
  end

  it "gives error when no description is entered" do
    product = Product.create(:name => 'Fruit', :cost => 5, :origin => "mexico")
    review = Review.create(:author => 'Frank', :content => 'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr', :rating => 4, :product_id => product.id)
    visit product_path(product)
    save_and_open_page
    click_on 'Edit'
    fill_in 'Author', :with => ''
    click_button 'Update Review'
    expect(page).to have_content 'errors'
  end
end
