# frozen_string_literal: true

module TicTacToe
  # Base class game
  class Game
    X_CHAR = 'X'
    O_CHAR = 'O'

    attr_reader :game_board

    # main method
    def self.start
      console = GameConsole.new(Game.new)
      console.run
    end

    def initialize
      @game_board = GameBoard.new
      @game_ai = GameAI.new(@game_board)
      @user_char = X_CHAR
      @ai_char = O_CHAR
    end

    def user_turn(int)
      @game_board.point_set(int, @user_char)
    end

    def ai_turn
      @game_ai.turn
    end

    def init_user(int)
      case int
      when 2
        @user_char = O_CHAR
        @ai_char = X_CHAR
      else
        @user_char = X_CHAR
        @ai_char = O_CHAR
      end
      @game_ai.init_char(@ai_char)
    end
  end
end
