class User < ApplicationRecord
  has_many :user_follows, foreign_key: :username
  has_many :follows, through: :user_follows, source: :follower
  has_many :activities, foreign_key: :username
end
