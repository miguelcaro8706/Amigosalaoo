class CreateSecretFriendships < ActiveRecord::Migration
  def change
    create_table :secret_friendships do |t|
      t.integer :person_id
      t.integer :friend_id
      t.integer :game_id

      t.timestamps
    end
  end
end
