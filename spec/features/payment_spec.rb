require 'rails_helper'

RSpec.feature 'Payment page', type: :feature do
  describe 'Paymen list Page' do
    before(:each) do
      @user = User.create(name: 'user', email: 'text@example.com', password: 'f4k3p455w0rd')
      sign_in(@user)
      @category1 = Category.create(name: 'Beef Ribs', icon: 'Kilograms', user_id: @user.id)
      @category2 = Category.create(name: 'BBQ Sauce', icon: 'Grams', user_id: @user.id)
      @category3 = Category.create(name: 'Potatoes', icon: 'Kilograms', user_id: @user.id)

      @payment1 = Payment.create(name: 'jaan', amount: 50, author_id: @user.id)
      @payment2 = Payment.create(name: 'khaan', amount: 70, author_id: @user.id)
      @category_payment = CategoryPayment.create(category_id: @category1.id, payment_id: @payment1.id)
      @category_payment = CategoryPayment.create(category_id: @category1.id, payment_id: @payment2.id)

      visit "/categories/#{@category1.id}/payment"
    end

    it 'shows payments for a category' do
      expect(page).to have_content('TRANSACTIONS')
    end
    it 'shows payments for a category' do
      expect(page).to have_content(@payment1.name.to_s)
      expect(page).to have_content("$#{@payment1.amount}")
      expect(page).to have_content(@payment2.name.to_s)
      expect(page).to have_content("$#{@payment2.amount}")
    end
  end
end
