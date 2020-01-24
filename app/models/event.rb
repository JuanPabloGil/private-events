class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :user_events
  has_many :users, through: :user_events, source: :user
  validates :desc, presence: true, length: { minimum: 8}
  validates :event_date, presence: true
  scope :upcoming, -> { where("event_date >= ?", Time.zone.now) }
  scope :past, -> { where("event_date < ?", Time.zone.now) }
end
