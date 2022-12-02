class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :friend_email
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
