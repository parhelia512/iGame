class AddAverageRatingToGame < ActiveRecord::Migration
  def change
    add_column :games, :average_rating, :integer
    add_column :games, :average_rating_number, :integer
  end
end
