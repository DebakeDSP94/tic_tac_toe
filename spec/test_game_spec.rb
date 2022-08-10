# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

# rubocop: disable Metrics/BlockLength

describe Game do
  describe '#play' do
    context 'when starting the game' do
      subject(:game) { described_class.new }

      before do
        game.instance_variable_set(:@board, instance_double(Board))
        game.instance_variable_set(:@player1, instance_double(Player))
        game.instance_variable_set(:@player2, instance_double(Player))
      end
      it 'calls make players' do
        allow(game.board).to receive(:display_board)
        allow(game).to receive(:play_turn)
        allow(game).to receive(:assign_name)
        expect(game).to receive(:make_players)
        game.play
      end

      it 'displays the board' do
        allow(game).to receive(:make_players)
        allow(game).to receive(:play_turn)
        expect(game.board).to receive(:display_board)
        game.play
      end

      it 'plays a turn' do
        allow(game.board).to receive(:display_board)
        allow(game).to receive(:make_players)
        expect(game).to receive(:play_turn)
        game.play
      end
    end
  end

  describe '#make_players' do
    context 'when setting up players' do
      subject(:game) { described_class.new }
      it 'calls assign_name twice' do
        expect(game).to receive(:assign_name).twice
        game.make_players
      end
    end
  end

  describe '#check_for_win' do
    context 'when checking if player has won' do
      subject(:win_game) { described_class.new }
      subject(:player1) { Player.new('Jimbob', 'X', [1, 2, 4]) }
      subject(:player2) { Player.new('Joe', 'O', [3, 5, 6]) }
      it 'plays a turn if no win found' do
        expect(win_game).to receive(:play_turn)
        win_game.check_for_win(player1, player2)
      end
    end
  end

  describe '#check_for_win' do
    context 'when checking if player has won' do
      subject(:win_game) { described_class.new }
      subject(:player1) { Player.new('Jimbob', 'X', [1, 2, 3]) }
      subject(:player2) { Player.new('Joe', 'O', [3, 5, 6]) }
      it 'ends the game if a player has won' do
        expect(win_game).not_to receive(:play_turn)
        win_game.check_for_win(player1, player2)
      end
    end
  end
end

# rubocop: enable Metrics/BlockLength
