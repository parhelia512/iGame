class AddGameCoverpictureToGames < ActiveRecord::Migration
  def change
    add_column :games, :game_coverpicture, :string
  end
end
