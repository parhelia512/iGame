class AddAttachmentGameCoverToGames < ActiveRecord::Migration
  def self.up
    change_table :games do |t|
      t.attachment :game_cover
    end
  end

  def self.down
    drop_attached_file :games, :game_cover
  end
end
