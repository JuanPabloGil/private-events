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

  describe "", :type => :feature do
    it 'Logs in an user' do
      User.create(name: 'Juan Pablo', email: 'jpablomgil@email.com')
      visit   '/sessions/new'
      fill_in('session_email', with: 'jpablomgil@email.com')
      click_button 'Log in'
      expect(page).to have_content("Juan Pablo")
    end
  end

  describe "GET '/events/new'", type: :feature do
    it 'Non user creating event' do
      visit('/events/new')
      expect(page).to have_content("You must be logged in first")
      expect(page).to have_content("Email")
      expect(page).to have_content("Log in")
    end
  end
