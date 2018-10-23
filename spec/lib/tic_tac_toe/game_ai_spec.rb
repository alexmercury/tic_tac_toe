require 'spec_helper'

require './lib/tic_tac_toe/exceptions'
require './lib/tic_tac_toe/game_board'
require './lib/tic_tac_toe/game_ai'

describe TicTacToe::GameBoard do
  let(:game_board) { TicTacToe::GameBoard.new }
  let(:game_ai) { TicTacToe::GameAI.new(game_board) }

  it 'Game AI' do
    game_ai.init_char(TicTacToe::GameBoard::O_CHAR)
    game_ai.turn
    game_ai.turn
    game_ai.turn
    game_ai.turn
    game_ai.turn
    game_ai.turn
    game_ai.turn
    game_ai.turn
    game_ai.turn
    expect(game_board.win_any?).to be(true)
  end
end
