require_relative 'player'

class GameOfLife
  def start_game
    player = Player.new
    player.start_game
  end
end