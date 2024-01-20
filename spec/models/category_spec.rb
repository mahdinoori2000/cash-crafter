require 'rails_helper'

RSpec.describe Category, type: :model do
    describe 'validations' do
      it 'requires a name' do
        category = Category.new(name: nil)
        expect(category).not_to be_valid
      end
  
      it 'requires an icon' do
        category = Category.new(icon: nil)
        expect(category).not_to be_valid
      end
  
      it 'requires the name to be unique' do
        Category.create(name: 'John')
        category = Category.new(name: 'John')
        expect(category).not_to be_valid
      end
    end
    describe 'associations' do
      it 'has many Payments' do
        category = Category.reflect_on_association(:payments)
        expect(category.macro).to eq(:has_many)
      end
  
      it 'has many Category_payments' do
        category = Category.reflect_on_association(:category_payments)
        expect(category.macro).to eq(:has_many)
      end
    end
end
