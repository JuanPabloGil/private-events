class Event < ApplicationRecord
  has_many :atendees, through: :user_event
  belongs_to :creator, class_name: "User"
end
