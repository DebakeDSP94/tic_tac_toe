# frozen_string_literal: true

# module contains the text outputs for the game
module Outputs
  def pick_square1(player1)
    $stdout.puts "#{player1.name}, please select a square"
  end

  def pick_square2(player2)
    $stdout.puts "#{player2.name}, please select a square"
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

  def player1_win
    $stdout.puts "#{player1.name} is the winner!"
  end

  def player2_win
    $stdout.puts "#{player2.name} is the winner"
  end
end
