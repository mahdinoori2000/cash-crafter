require 'rails_helper'

RSpec.feature 'Categories Page', type: :feature do
  describe 'Categories Page' do
    before(:each) do
      @user = User.create(name: 'user', email: 'test@example.com', password: 'f4k3p455w0rd')
      sign_in(@user)
      @category1 = Category.create(name: 'Beef Ribs', icon: 'Kilograms', user_id: @user.id)
      @category2 = Category.create(name: 'BBQ Sauce', icon: 'Grams', user_id: @user.id)
      @category3 = Category.create(name: 'Potatoes', icon: 'Kilograms', user_id: @user.id)

      visit authenticated_root_path
    end

    it 'should only show the title icon' do
      expect(page).to have_content('Sign Out')
      expect(page).to have_content("#{@category2.name}")
      expect(page).to have_content('Add New category')
      expect(page).to_not have_content("#{@category1.user_id}")
    end
  end
end
