require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do

      cat1 = Category.find_or_create_by! name: 'Apparel'

      @product1 = cat1.products.create!({
        name:  'Men\'s Classy shirt',
        description: Faker::Hipster.paragraph(4),
        image: 'apparel1.jpg',
        quantity: 10,
        price: 64.99
      })

      @product2 = cat1.products.create!({
        name:  'Women\'s Zebra pants',
        description: Faker::Hipster.paragraph(4),
        image: 'apparel2.jpg',
        quantity: 18,
        price: 124.99
      })

    end

    it 'deducts quantity from products based on their line item quantities' do

      initial_quantities = { product1: @product1.quantity, product2: @product2.quantity }
      order_quantities = { product1: 3, product2: 0 }
      @order = Order.new(
        email: 'test@test.test',
        total_cents: order_quantities[:product1] * initial_quantities[:product1], # 3x men's classy shirts
        stripe_charge_id: 12345,
      )

      @order.line_items.new(
                product: @product1,
                quantity: order_quantities[:product1],
                item_price: @product1.price,
                total_price: @product1.price * initial_quantities[:product1]
              )

      @order.save!
      @product1.reload
      @product2.reload

      expect(@product1.quantity).to eql(initial_quantities[:product1] - order_quantities[:product1])
      expect(@product2.quantity).to eql(initial_quantities[:product2] - order_quantities[:product2])

    end

    it 'does not deduct quantity from products that are not in the order' do
      initial_quantities = { product1: @product1.quantity, product2: @product2.quantity }
      order_quantities = { product1: 3, product2: 0 }
      @order = Order.new(
        email: 'test@test.test',
        total_cents: order_quantities[:product1] * initial_quantities[:product1], # 3x men's classy shirts
        stripe_charge_id: 12345,
      )

      @order.line_items.new(
                product: @product1,
                quantity: order_quantities[:product1],
                item_price: @product1.price,
                total_price: @product1.price * initial_quantities[:product1]
              )

      @order.save!
      @product1.reload
      @product2.reload

      expect(@product2.quantity).to eql(initial_quantities[:product2] - order_quantities[:product2])

    end
  end
end
