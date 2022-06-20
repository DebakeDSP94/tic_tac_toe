# frozen_string_literal: true

# Creates player instance
class Player
  attr_accessor :name, :sign, :moves

  def initialize(name, sign, moves = [])
    @name = name
    @sign = sign
    @moves = moves
  end

  def assign_name
    puts "#{name} What is your name?"
    @name = gets.chomp
  end
end
