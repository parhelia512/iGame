class AddRatingToPlayedRelationship < ActiveRecord::Migration
  def change
    add_column :played_relationships, :rating, :integer
  end
end
