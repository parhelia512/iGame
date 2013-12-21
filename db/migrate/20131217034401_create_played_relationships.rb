class CreatePlayedRelationships < ActiveRecord::Migration
  def change
    create_table :played_relationships do |t|
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
  end
end
