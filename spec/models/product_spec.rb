require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do

    describe 'initial example' do
      it 'product with the four fields set will save successfully' do
        @product = Product.new
        @product.name = 'Hip Wallet'
        @product.price = 3000
        @product.quantity = 46
        @product.category = Category.new
        @product.description = 'Really hip wallet, many functionalities'
        expect(@product.valid?).to be true
      end
    end

    describe 'test name validation' do
      it 'expect error if name is nil' do
        @product = Product.create(name: nil, price_cents: 3000, quantity: 46, category: Category.new)
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end

    describe 'test price validation' do
      it 'expect error if price is nil' do
        @product = Product.create(price_cents: nil, name: 'Hip Wallet', quantity: 46, category: Category.new)
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end 
    end

    describe 'test quantity validation' do
      it 'expect error if quantity is nil' do
        @product = Product.create(name: 'Hip Wallet', price_cents: 3000, quantity: nil, category: Category.new)
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    describe 'test category validation' do
      it 'expect error if category is nil' do
        @product = Product.create(name: 'Hip Wallet', price_cents: 3000, quantity: 46, category: nil)
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end

  end
end
