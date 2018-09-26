require_relative 'board'
require_relative 'cell'

class Player
  attr_accessor :board, :cell

  def initialize
    @board = Board.new
    @cell = Cell.new
  end

  def start_game
    cells_alive = receive_cells_alive
    exits_space_on_board = exist_range_on_board?(cells_alive)
    if exits_space_on_board
      array_cells_alive = cell.generate_cells_alive(cells_alive)
      board.insert_values_on_board(array_cells_alive)
      puts
      begin
        while true
          board.render_board
          board.apply_rules
          puts "Press enter to continue"
          puts "If you want to stop the game press: ctrl + c"
          gets.chomp
          system 'clear'
        end
      rescue Exception => error
          puts "Game over"
      end
    end
  end
  
  def receive_cells_alive
    print 'Write the number of cells alive that you wish: '
    cells_alive = gets.chomp.to_i
  end

  def exist_range_on_board?(cells)
    if cells >= 1 && cells <=  300
      true
    else
      puts 'The number of cells exceed size of board'
      start_game
    end
  end
end