class Game < ActiveRecord::Base

  has_many :played_relationships, foreign_key: "game_id"
  has_many :users, :through => :played_relationships

  has_many :game_comments
end
