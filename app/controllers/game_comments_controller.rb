class GameCommentsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @comment = @game.game_comments.create(params[:game_comment].permit(:commenter, :body))
    redirect_to game_path(@game)
  end
end
