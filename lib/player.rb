# frozen_string_literal: true

# Creates player instance
class Player
  attr_accessor :name, :sign, :moves

  def initialize(name, sign, moves = [])
    @name = name
    @sign = sign
    @moves = moves
  end
end
