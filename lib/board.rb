class Board
  attr_accessor :board, :cell

  def initialize
    @board = Array.new(15){Array.new(20)}
    @cell = Cell.new
  end

  def render_board 
    board.each do |row|
      print row
      puts
    end
  end

  def insert_values_on_board(array_cells_alive)
    draw_cells_alive_on_board(array_cells_alive)
    draw_dead_cells_on_board
  end

  def draw_cells_alive_on_board(array_cells_alive)
    array_cells_alive.each do |cell|
      board[cell.first][cell.last] = 1
    end
  end

  def iterate_over_board
    board.length.times do |row|
      board[row].length.times do |column|
        draw_cells_alive_on_board(row, column)
      end
    end
  end
  
  def draw_dead_cells_on_board
    board.length.times do |row|
      board[row].length.times do |column|
        if board[row][column] != 1
          board[row][column] = 0
        end
      end
    end
  end

  def apply_rules
    board.length.times do |row|
      board[row].length.times do |column|
        neighbors = cell.count_neighbors(board, row, column)
        reproduce_cells(neighbors, row, column)
      end
    end
  end

  def reproduce_cells(neighbors, row, column)
    if board[row][column] == 1
      board[row][column] = neighbors == 2 || neighbors == 3 ? 1 : 0
    else
      board[row][column] == 0 && neighbors == 3 ? board[row][column] = 1 : return
    end
  end
end