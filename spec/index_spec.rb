require 'rails_helper'

RSpec.describe 'index Auth', type: :system do
  describe 'index' do
    it 'Needs to Login to Attend Events' do
      visit events_path
      expect(page).to_not have_content('Upcoming Events')
    end
  end
end

RSpec.describe '`Sign Up` & `Login`', type: :system do
  describe 'index' do
    it 'User `Sign In`' do
      visit login_path
      expect(page).to have_content('Login')
    end
    it 'New User `Sign up`' do
      visit login_path
      expect(page).to have_content('You dont have an account? Sign Up here')
    end
  end
end
