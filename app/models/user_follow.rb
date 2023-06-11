class UserFollow < ApplicationRecord
  belongs_to :user, foreign_key: :username, primary_key: :username
  belongs_to :follower, class_name: 'User', foreign_key: :follower, primary_key: :username
end
