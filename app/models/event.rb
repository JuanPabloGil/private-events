class Event < ApplicationRecord
  has_many :user_events
  has_many :atendees, through: :user_events
end
