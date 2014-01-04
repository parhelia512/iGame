class CreateGameComments < ActiveRecord::Migration
  def change
    create_table :game_comments do |t|
      t.string :commenter
      t.text :body
      t.references :game

      t.timestamps
    end

    add_index :game_comments, :game_id
  end
end
