# frozen_string_literal: true

require_relative 'outputs'

# class Game - handles initializing the game and player turns
class Game
  include Outputs
  attr_accessor :board, :player1, :player2, :validated, :player_turn, :tied, :win
  attr_reader :win_sets

  def initialize
    @board = Board.new
    @player1 = Player.new('player 1', 'X')
    @player2 = Player.new('player 2', 'O')
    @validated = nil
    @player_turn = 'player_1'
    @win_sets = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                 [2, 5, 8], [3, 6, 9], [3, 5, 7], [1, 5, 9]]
  end

  def play
    make_players
    system 'clear' || 'cls'
    board.display_board
    start_a_turn(player1, player2)
  end

  def make_players
    assign_name(player1)
    assign_name(player2)
  end

  def assign_name(player)
    $stdout.puts "#{player.name} What is your name?"
    player.name = gets.chomp
  end

  def start_a_turn(player1, player2)
    if board.check_for_tie
      draw
      return
    end

    if @player_turn == 'player_1'
      play_a_turn(player1)
    else
      play_a_turn(player2)
    end
    check_for_win(player1, player2)
  end

  def play_a_turn(player)
    pick_square(player)
    player_choice = $stdin.gets.chomp.to_i
    @validated = board.validate_input(player_choice, player)
    msg_out(validated)
    return unless @validated == 'valid'

    @player_turn = if @player_turn == 'player_1'
                     'player_2'
                   else
                     'player_1'
                   end
  end

  def msg_out(validated)
    system 'clear' || 'cls'
    board.display_board
    square_taken if validated == 'taken'
    invalid_input if validated == 'invalid'
    good_choice if validated == 'valid'
  end

  def check_for_win(player1, player2)
    game_over = false
    [player1, player2].each do |player|
      win_sets.each do |set|
        if check_for_winning_set(player, set)
          player_win(player)
          game_over = true
        end
      end
    end
    start_a_turn(player1, player2) unless game_over
  end

  def check_for_winning_set(player, set)
    player.moves.intersection(set) == set
  end
end
