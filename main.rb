# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                        [1, 4, 7], [2, 5, 8], [3, 6, 9],
                        [1, 5, 9], [3, 5, 7]].freeze

board = Board.new

player1 = Player.new('X')
player2 = Player.new('O')

numbers = Set.new

1.upto(9) do |num|
  numbers.add(num)
end

winner_found = false

puts 'TIC___TAC___TOE'
puts
puts 'Here is the map of each position'
Board.default_display

puts 'Here is the tic tac toe board'
board.display

0.upto(9) do |elm|
  loop do
    ind = elm % 2
    puts "player #{ind + 1}, please choose a number between 1 and 9, that is not occupied"
    value = gets.chomp.to_i

    next if value.to_i > 9 || value.to_i < 1

    new_value = value.to_i - 1
    row = new_value / 3
    col = new_value % 3

    next if board.element_there?(row, col)

    if ind.zero?
      board.add(row, col, player1.symbol)
      player1.append(new_value + 1)
      filtered = WINNING_COMBINATIONS.select do |list|
        (list & player1.choices).length == 3
      end
      unless filtered.empty?
        winner_found = true
        puts 'The Winner is Player 1'
      end
    else
      board.add(row, col, player2.symbol)
      player2.append(new_value + 1)
      filtered = WINNING_COMBINATIONS.select do |list|
        (list & player2.choices).length == 3
      end
      unless filtered.empty?
        winner_found = true
        puts 'The Winner is Player 2'
      end
    end

    numbers.delete(new_value + 1)
    board.display
    break
  end
  break if winner_found
  break if numbers.empty?
end

puts "It's a draw" unless winner_found
