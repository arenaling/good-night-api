class CreateUserFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :user_follows do |t|
      t.string :username
      t.string :follower

      t.timestamps
    end
  end
end
