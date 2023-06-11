class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :username
      t.datetime :start_sleep
      t.datetime :end_sleep

      t.timestamps
    end

    add_foreign_key :activities, :users, column: :username, primary_key: :username
  end
end
