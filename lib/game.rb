# frozen_string_literal: true

require_relative 'outputs'

# class Game - handles initializing the game and player turns
class Game
  include Outputs
  attr_accessor :board, :player1, :player2, :validated, :player_turn, :tied, :win
  attr_reader :win_sets

  def initialize
    @board = Board.new
    @player1 = nil
    @player2 = nil
    @validated = nil
    @player_turn = 'player_1'
    @tied = false
    @win = false
    @win_sets = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                 [2, 5, 8], [3, 6, 9], [3, 5, 7], [1, 5, 9]]
  end

  def play
    make_players
    board.display_board
    play_turn(player1, player2)
  end

  def make_players
    @player1 = Player.new('player 1', 'X')
    @player2 = Player.new('player 2', 'O')

    player1.assign_name
    player2.assign_name
  end

  def play_turn(player1, player2)
    @tied = board.check_for_tie
    draw if @tied == true
    return if @tied

    if @player_turn == 'player_1'
      player1_turn(player1)
    else
      player2_turn(player2)
    end
    check_for_win(player1, player2, win_sets)
  end

  def player1_turn(player1)
    pick_square1(player1)
    player_choice = $stdin.gets.chomp.to_i
    @validated = board.validate_input(player_choice, player1)
    msg_out(validated)
    @player_turn = 'player_2' if @validated == 'valid'
  end

  def player2_turn(player2)
    pick_square2(player2)
    player_choice = $stdin.gets.chomp.to_i
    @validated = board.validate_input(player_choice, player2)
    msg_out(validated)
    @player_turn = 'player_1' if @validated == 'valid'
  end

  def msg_out(validated)
    system 'clear' || 'cls'
    board.display_board
    square_taken if validated == 'taken'
    invalid_input if validated == 'invalid'
    good_choice if validated == 'valid'
  end

  def check_for_win(player1, player2, win_sets)
    win_sets.each do |set|
      if @player1.moves.intersection(set) == set
        player1_win
        @win = true
      elsif @player2.moves.intersection(set) == set
        player2_win
        @win = true
      end
    end
    play_turn(player1, player2) unless @win == true
  end
end
