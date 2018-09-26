class Cell
  def generate_cells_alive(cells_alive)
    array_cells_alive = Array.new
    while cells_alive > 0
      cell = [rand(0..14), rand(0..19)]
      unless array_cells_alive.include?(cell)
        array_cells_alive << cell
        cells_alive -= 1
      end      
    end
    array_cells_alive
  end

  def count_neighbors(board, row, column)
    neighbors = 0
    rows_board = board.length
    columns_board = board[0].length
    posible_neighbors = [[row-1, column-1], [row, column-1], [row+1, column-1], [row+1, column], [row+1, column+1], [row, column+1], [row-1, column+1], [row-1, column]]
    posible_neighbors.each do |position|
      if position.first >= 0 && position.first < rows_board
        if position.last >= 0 && position.last < columns_board
          if board[position.first][position.last] == 1
            neighbors += 1
          end
        end
      end
    end
    neighbors
  end
end