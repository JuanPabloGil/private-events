# frozen_string_literal: true

class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :event_id, presence: true
  validates :user_id, presence: true
end
