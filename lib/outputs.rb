# frozen_string_literal: true

# module contains the text outputs for the game
module Outputs
  def pick_square1(player1)
    puts "#{player1.name}, please select a square"
  end

  def pick_square2(player2)
    puts "#{player2.name}, please select a square"
  end

  def invalid_input
    puts 'Invalid input. Please try again'
  end

  def square_taken
    puts 'That square is already taken. Please choose another'
  end

  def good_choice
    puts 'Well played.  You chose a valid square'
  end

  def draw
    puts 'This game is a draw.'
  end

  def player1_win
    puts "#{player1.name} is the winner!"
  end

  def player2_win
    puts "#{player2.name} is the winner"
  end
end
