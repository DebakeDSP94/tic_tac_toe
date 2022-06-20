# frozen_string_literal: true

require_relative 'game'

# handles game board functionality
class Board
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '---+---+---'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '---+---+---'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def validate_input(square, player)
    return 'invalid' unless (1..9).include?(square)

    if @board[square - 1] == 'X' || @board[square - 1] == 'O'
      'taken'
    else
      @board[square - 1] = player.sign
      player.moves.push(square)
      'valid'
    end
  end

  def check_for_tie
    over = true if @board.intersection([1, 2, 3, 4, 5, 6, 7, 8, 9]).empty?
    over
  end
end
