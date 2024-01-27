require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'validations' do
    it 'requires a name' do
      payment = Payment.new(name: nil)
      expect(payment).not_to be_valid
    end

    it 'requires a amount' do
      payment = Payment.new(amount: nil)
      expect(payment).not_to be_valid
    end

    it 'requires a author_id' do
      payment = Payment.new(author_id: nil)
      expect(payment).not_to be_valid
    end

    it 'requires the name to be unique' do
      Payment.create(name: 'Rice')
      payment = Payment.new(name: 'Rice')
      expect(payment).not_to be_valid
    end
  end
  describe 'associations' do
    it 'has many categories' do
      payment = Payment.reflect_on_association(:categories)
      expect(payment.macro).to eq(:has_many)
    end

    it 'has many category_payment' do
      payment = Payment.reflect_on_association(:categories)
      expect(payment.macro).to eq(:has_many)
    end
  end
end
