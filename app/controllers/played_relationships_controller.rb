class PlayedRelationshipsController < ApplicationController
  def create

    @game = Game.find(relationship_params[:game_id])
    current_user.played!(@game)
    redirect_to game_path(@game)
  end

  def destroy
    #render params.inspect
    #@game = Game.find(PlayedRelationship.find(params[:id]).game
    @game = Game.find(relationship_params[:game_id])
    current_user.unplayed!(@game)
    redirect_to game_path(@game)
  end

  def relationship_params
    params.require(:played_relationship).permit(:user_id, :game_id)
  end

end