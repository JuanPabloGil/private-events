# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_events
  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'
  has_many :attended_events, through: :user_events, source: :events

  validates :name, presence: true, length: { maximum: 50 },
                   uniqueness: { case_sensitive: true }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
