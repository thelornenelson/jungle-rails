require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "They can click 'add to cart' and cart item count increases by 1" do
    visit root_path
    cart_items = 0

    within 'nav.navbar' do
      expect(page).to have_content "Cart (#{cart_items})"
    end

    within first 'article.product' do
      click_on 'Add'
      cart_items += 1
    end

    within 'nav.navbar' do
      expect(page).to have_content "Cart (#{cart_items})"
    end

  end

  scenario "They can view cart and checkout an order" do

    visit root_path

    within first 'article.product' do
      click_on 'Add'
    end

    visit '/cart'

    first('button.stripe-button-el').click

    within_frame 'stripe_checkout_app' do
      fill_in placeholder: 'Card number', with: '4242424242424242'
      fill_in placeholder: 'MM / YY', with: "01/#{Date.today.year + 1}"
      fill_in placeholder: 'CVC', with: '123'

      click_button 'Pay'
    end

    expect(page).to have_content 'Thank you for your order'

  end
end
