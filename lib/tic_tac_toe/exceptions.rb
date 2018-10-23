# frozen_string_literal: true

module TicTacToe
  class Exception < StandardError; end
  class InvalidGameBoardPoint < TicTacToe::Exception; end
  class DenyGameBoardPoint < TicTacToe::Exception; end
end
