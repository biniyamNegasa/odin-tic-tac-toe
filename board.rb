# frozen_string_literal: true

# A class that is used to display the current board state
class Board
  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def add(row, col, symbol)
    @board[row][col] = symbol
  end

  def display
    puts '-------'
    @board.each do |list|
      print '| '
      list.each do |elm|
        print elm, '| '
      end
      puts
      puts '-------'
    end
  end

  def element_there?(row, col)
    return false if @board[row][col].nil?

    true
  end

  def self.default_display
    curr = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    puts '-------'
    curr.each do |list|
      print '| '
      list.each do |elm|
        print elm, '| '
      end
      puts
      puts '-------'
    end
  end
end
