module GamesHelper
  def game_title(id)
    a = Game.find_by_id(id)
    a.name
  end
end
