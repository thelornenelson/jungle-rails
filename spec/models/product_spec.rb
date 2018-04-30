require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    subject(:category) { Category.new name: 'test' }
    subject(:product) { category.products.new({
      name: 'test',
      description: 'test description',
      image: 'image.jpg',
      price_cents: 4500,
      quantity: 50
      })
    }

    it 'should be valid when name, description, image, price, quantity, and category are included' do
        expect(product).to be_valid
    end

    it 'should not be valid when name is nil' do
      product.name = nil
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include "Name can't be blank"
    end

    it 'should not be valid when price is nil' do
      product.price_cents = nil
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include "Price can't be blank"

    end

    it 'should not be valid when quantity is nil' do
      product.quantity = nil
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'should not be valid when category is nil' do
      product.category = nil
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include "Category can't be blank"

    end

  end
end
