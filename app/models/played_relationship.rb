class PlayedRelationship < ActiveRecord::Base
  #attr_accessible :user_id, :game_id
  belongs_to :user, class_name: "User"
  belongs_to :game, class_name: "Game"
end
