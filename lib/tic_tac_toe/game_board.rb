# frozen_string_literal: true

module TicTacToe
  # Board
  class GameBoard
    X_CHAR = 'X'
    O_CHAR = 'O'

    # Array => ['', 'X', 'O', 'O', 'X', '', '', 'X', 'O']
    attr_reader :board
    attr_reader :winner

    def initialize
      @board = Array.new(9, '')
    end

    def point_set(int, char)
      validate_point(int)
      @board[int - 1] = char
    end

    def win_any?
      win_combinations.each do |cb|
        next unless win_combination?(cb)

        @winner = @board[cb[0]]
        return true
      end

      false
    end

    # All win combos
    def win_combinations
      [
        # rows
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        # cols
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        # diagonals
        [0, 4, 8],
        [2, 4, 6]
      ]
    end

    private

    def win_combination?(combo)
      @board[combo[0]].eql?(@board[combo[1]]) &&
        @board[combo[1]].eql?(@board[combo[2]]) &&
        !@board[combo[0]].eql?('')
    end

    def validate_point(int)
      raise InvalidGameBoardPoint unless (1..9).cover?(int)

      raise DenyGameBoardPoint unless @board[int - 1].eql?('')
    end
  end
end
