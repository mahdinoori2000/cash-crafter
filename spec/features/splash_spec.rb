require 'rails_helper'

RSpec.feature 'Splash Page', type: :feature do
  scenario 'User visits the splash page when not authenticated' do
    visit unauthenticated_root_path
    expect(page).to have_content 'Log IN'
    expect(page).to have_content 'Sign UP'
    expect(page).to have_content 'Cash Crafter'
  end
end
