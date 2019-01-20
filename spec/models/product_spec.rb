require 'rails_helper'

describe Product, type: :model do
  describe 'validations' do
    describe '#name' do
      it 'validates presence' do
        product = Product.new

        expect(product).not_to           be_valid
        expect(product.errors[:name]).to include "can't be blank"
      end
    end

    describe '#price' do
      it 'validates presence' do
        product = Product.new

        expect(product).not_to            be_valid
        expect(product.errors[:price]).to include "can't be blank"
      end

      it 'validates numericality' do
        product = Product.new

        expect(product).not_to            be_valid
        expect(product.errors[:price]).to include 'is not a number'
      end

      it 'validates greater_than 0' do
        product = Product.new(price: -0.8)

        expect(product).not_to            be_valid
        expect(product.errors[:price]).to include 'must be greater than 0'
      end
    end
  end
end
