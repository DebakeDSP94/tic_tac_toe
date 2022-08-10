# frozen_string_literal: true

# module contains the text outputs for the game
module Outputs
  def pick_square(player)
    $stdout.puts "#{player.name}, please select a square"
  end

  def invalid_input
    $stdout.puts 'Invalid input. Please try again'
  end

  def square_taken
    $stdout.puts 'That square is already taken. Please choose another'
  end

  def good_choice
    $stdout.puts 'Well played.  You chose a valid square'
  end

  def draw
    $stdout.puts 'This game is a draw.'
  end

  def player_win(player)
    $stdout.puts "#{player.name} is the winner!"
  end
end
