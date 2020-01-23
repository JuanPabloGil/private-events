class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :user_events
  has_many :users, through: :user_events, source: :user
end
