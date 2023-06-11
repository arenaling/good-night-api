class CreateUserFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :user_follows do |t|
      t.string :username, null: false
      t.string :follower, null: false

      t.timestamps
    end

    add_foreign_key :user_follows, :users, column: :username, primary_key: :username
    add_foreign_key :user_follows, :users, column: :follower, primary_key: :username
  end
end
