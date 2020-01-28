require 'rails_helper'

  describe "GET '/sessions/new'", :type => :feature do
    it 'Shows the sign in form' do
      visit('/sessions/new')
      expect(page).to have_content("Email")
      puts 'You can enter credentials here'
    end
  end


# describe "the signin process", type: :feature do
#   before :each do
#     User.make(email: 'user@example.com', password: 'password')
#   end
#
#   it "signs me in" do
#     visit '/sessions/new'
#     within("#session") do
#       fill_in 'Email', with: 'user@example.com'
#       fill_in 'Password', with: 'password'
#     end
#     click_button 'Sign in'
#     expect(page).to have_content 'Success'
#   end
# end
