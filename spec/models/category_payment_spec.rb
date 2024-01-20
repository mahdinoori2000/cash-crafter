require 'rails_helper'

RSpec.describe CategoryPayment, type: :model do
  describe 'associations' do
    it 'has many category' do
      category_payment = CategoryPayment.reflect_on_association(:category)
      expect(category_payment.macro).to eq(:belongs_to)
    end

    it 'has many payment' do
      category_payment = CategoryPayment.reflect_on_association(:payment)
      expect(category_payment.macro).to eq(:belongs_to)
    end
  end
end
