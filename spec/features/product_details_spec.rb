require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They navigate to a product detail page from the home page by clicking on a product link" do
    visit root_path

    # click on
    first('article.product a').click

    expect(page).to have_css 'section.products-show'

  end

  scenario "They navigate to a product detail page from the home page by clicking on a product detail button" do
    visit root_path

    # click on
    within first('article.product') do
      click_on "Details"
    end

    expect(page).to have_css 'section.products-show'

  end

  scenario "They can view details for the correct product on the product detail page" do
    visit root_path

    product = Product.first

    click_on product.name

    expect(page).to have_content product.name
    expect(page).to have_content product.description
    expect(page).to have_content product.quantity
    expect(page).to have_content product.price

  end
end
