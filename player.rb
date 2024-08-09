# frozen_string_literal: true

# A class that initializes a player for the game
class Player
  attr_reader :symbol, :choices

  def initialize(symbol)
    @symbol = symbol
    @choices = []
  end

  def append(choice)
    @choices.push(choice)
  end
end
