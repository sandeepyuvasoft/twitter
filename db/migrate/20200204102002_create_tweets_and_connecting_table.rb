class CreateTweetsAndConnectingTable < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.references :user
      t.text :content

      t.timestamps
    end

    create_table :follows do |t|
      t.integer :follower_id
      t.integer :followee_id

      t.timestamps
    end

    add_index :follows, :follower_id
    add_index :follows, :followee_id
    add_index :follows, [:follower_id, :followee_id], unique: true
  end
end
