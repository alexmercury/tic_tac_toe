require 'spec_helper'

require './lib/tic_tac_toe/exceptions'
require './lib/tic_tac_toe/game_board'

describe TicTacToe::GameBoard do
  let(:game_board) { TicTacToe::GameBoard.new }

  it 'Board initialize' do
    expect(game_board.board.length).to be(9)
    expect(game_board.board.uniq!).to eql([''])
  end

  it 'Validate point' do
    expect { game_board.point_set(20, TicTacToe::GameBoard::O_CHAR) }.to(
      raise_error(TicTacToe::InvalidGameBoardPoint)
    )
    expect { game_board.point_set(0, TicTacToe::GameBoard::X_CHAR) }.to(
      raise_error(TicTacToe::InvalidGameBoardPoint)
    )
    expect { game_board.point_set(-9, TicTacToe::GameBoard::O_CHAR) }.to(
      raise_error(TicTacToe::InvalidGameBoardPoint)
    )

    game_board.point_set(2, TicTacToe::GameBoard::X_CHAR)

    expect { game_board.point_set(2, TicTacToe::GameBoard::O_CHAR) }.to(
      raise_error(TicTacToe::DenyGameBoardPoint)
    )
  end

  it 'x point set' do
    game_board.point_set(1, TicTacToe::GameBoard::X_CHAR)
    expect(game_board.board[0]).to be(TicTacToe::GameBoard::X_CHAR)
  end

  it 'o point set' do
    game_board.point_set(1, TicTacToe::GameBoard::O_CHAR)
    expect(game_board.board[0]).to be(TicTacToe::GameBoard::O_CHAR)
  end

  it 'Win any?' do
    game_board.point_set(1, TicTacToe::GameBoard::O_CHAR)
    game_board.point_set(2, TicTacToe::GameBoard::X_CHAR)
    game_board.point_set(3, TicTacToe::GameBoard::O_CHAR)
    expect(game_board.win_any?).to be(false)
    game_board.point_set(5, TicTacToe::GameBoard::X_CHAR)
    game_board.point_set(4, TicTacToe::GameBoard::O_CHAR)
    game_board.point_set(8, TicTacToe::GameBoard::X_CHAR)
    expect(game_board.win_any?).to be(true)
    expect(game_board.winner).to be(TicTacToe::GameBoard::X_CHAR)
  end
end
