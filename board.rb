# frozen_string_literal: true

# A class that is used to display the current board state
class Board
  def initialize
    @board = Array.new(3, 3)
  end

  def add(row, col, symbol)
    board[row][col] = symbol
  end

  def display
    puts '--------------'
    board.each do |list|
      print '| '
      list.each do |elm|
        print elm, '| '
      end
      puts '--------------'
    end
  end
end
