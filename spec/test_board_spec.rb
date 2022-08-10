# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

# rubocop:disable Metrics/BlockLength

describe Board do
  describe '#validate_input' do
    context 'when a player input has been received' do
      subject(:board) { Board.new }
      subject(:player1) { Player.new('Jimbob', 'X') }
      subject(:player2) { Player.new('Joe', 'O') }

      it 'returns invalid if not in (1..9)' do
        letter = 'g'
        expect(board.validate_input(letter, player1)).to eq('invalid')
      end

      context 'when a player input has been received' do
        subject(:board) { Board.new }
        subject(:player1) { Player.new('Jimbob', 'X') }
        subject(:player2) { Player.new('Joe', 'O') }
        before do
          board.instance_variable_set(:@board, ['X', 2, 3, 4, 5, 6, 7, 8, 9])
        end
        it 'returns taken if board square taken' do
          input = 1
          expect(board.validate_input(input, player1)).to eq('taken')
        end
      end

      context 'when a player input has been received' do
        subject(:board) { Board.new }
        subject(:player1) { Player.new('Jimbob', 'X') }
        subject(:player2) { Player.new('Joe', 'O') }
        before do
          board.instance_variable_set(:@board, ['X', 2, 3, 4, 5, 6, 7, 8, 9])
        end
        it 'returns valid if valid input' do
          input = 7
          expect(board.validate_input(input, player1)).to eq('valid')
        end
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
