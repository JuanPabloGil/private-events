# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  let(:user) { User.create(name: 'user1', email: 'user1@example.com') }
  let(:event) { Event.create(desc: 'First event', event_date: '1990/11/12', creator_id: user.id) }

  let(:user_event) { UserEvent.new(user_id: user.id, event_id: event.id) }

  it 'Checks if Event model is valid' do
    user_event.save
    expect(user_event).to be_valid
  end

  it 'Checks if validations for Event are working' do
    user_event.event_id = nil
    user_event.save
    expect(user_event).not_to be_valid
  end
end
