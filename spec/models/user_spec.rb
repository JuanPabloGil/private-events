# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) { User.new(name: 'user1', email: 'user1@example.com') }
  let(:user2) { User.new(name: nil, email: '') }

  context 'Checking if user is valid' do
    it 'Checks if the user is valid' do
      expect(user1).to be_valid
    end

    it 'Checks if the user is not valid' do
      expect(user2).not_to be_valid
    end
  end

  context 'Checking for the User validations' do
    it "Check if user email doesn't exists" do
      user1.email = nil
      expect(user1).not_to be_valid
    end

    it 'Check if the user name exists' do
      user = User.new(name: nil, email: 'foo@foo.com')
      expect(user).not_to be_valid
    end

    it 'Check if user email exists' do
      user2.name = 'you'
      user2.email = 'foo@foooo.com'
      user2.save
      expect(user2).to be_valid
    end
  end
end
