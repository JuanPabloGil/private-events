require 'rails_helper'

  describe "GET '/sessions/new'", :type => :feature do
    it 'Shows the sign in form' do
      visit('/sessions/new')
      expect(page).to have_content("Email")
    end

    it 'Shows the purpose of the form' do
      visit('/sessions/new')
      expect(page).to have_content("Log in")
    end
  end
