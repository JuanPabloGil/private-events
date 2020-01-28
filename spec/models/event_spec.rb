# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.new(name: 'user1', email: 'user1@example.com') }
  let(:event) { Event.new(desc: 'the previous description was too short', event_date: '1980/10/10') }

  it 'Checks if Event model is valid' do
    user.save
    event.creator_id = user.id
    expect(event).to be_valid
  end

  context 'Checking for the Event validations' do
    it 'Checks if the event description is valid ' do
      event.desc = ''
      user.save
      event.creator_id = user.id
      expect(event).not_to be_valid
    end

    it 'Checks if the event description is too short ' do
      event.desc = 'aa'
      user.save
      event.creator_id = user.id
      expect(event).not_to be_valid
    end

    it 'Checks if the email is present ' do
      user.email = ''
      user.save
      event.creator_id = user.id
      expect(event).not_to be_valid
    end

    it 'Checks if the event date its present ' do
      event.event_date = nil
      user.save
      event.creator_id = user.id
      expect(event).not_to be_valid
    end
  end
end
