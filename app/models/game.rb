class Game < ActiveRecord::Base

  has_many :played_relationships, foreign_key: "game_id"
  has_many :users, :through => :played_relationships

  has_many :game_comments

  has_attached_file :game_cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  mount_uploader :game_coverpicture, GameCoverUploader
end
