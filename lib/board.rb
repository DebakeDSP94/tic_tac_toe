# frozen_string_literal: true

require_relative 'game'

# handles game board functionality
class Board
  attr_accessor :board

  def initialize(board = [1, 2, 3, 4, 5, 6, 7, 8, 9])
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '---+---+---'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '---+---+---'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def validate_input(player_choice, player)
    return 'invalid' unless (1..9).include?(player_choice)

    if @board[player_choice - 1] == 'X' || @board[player_choice - 1] == 'O'
      'taken'
    else
      @board[player_choice - 1] = player.sign
      player.moves.push(player_choice)
      player.moves.sort!
      'valid'
    end
  end

  def check_for_tie
    true if @board.intersection([1, 2, 3, 4, 5, 6, 7, 8, 9]).empty?
  end
end
