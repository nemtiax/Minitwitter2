class CreateFollowerConnections < ActiveRecord::Migration
  def change
    create_table :follower_connections do |t|
      t.integer :follower_id
      t.integer :followee_id

      t.timestamps
    end
  end
end
