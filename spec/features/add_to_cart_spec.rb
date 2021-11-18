require 'rails_helper'

RSpec.feature "Visitor navigates to home page and clicks on a product and add it to his cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add a product to their cart" do
    # ACT
    visit root_path

    # click on Add
    click_button("Add", match: :first)
    sleep 5
  
    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content "My Cart (1)"
  end
end