class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    dd_index :relationships, :follower_id
    add_index :relationships, :following_id
    add_index :relationships, [:follower_id, :following_id], unique: true
  end
end
