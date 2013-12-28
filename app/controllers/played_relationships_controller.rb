class PlayedRelationshipsController < ApplicationController
  def create
    @game = Game.find(relationship_params[:game_id])
    current_user.played!(@game)
    respond_to
    respond_with
  end

  def destroy
    @game = PlayedRelationship.find(params[:id]).game
    current_user.unplayed!(@game)
  end

  def relationship_params
    params.require(:played_relationship).permit(:user_id, :game_id)
  end

end