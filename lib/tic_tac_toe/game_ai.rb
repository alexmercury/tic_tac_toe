# frozen_string_literal: true

module TicTacToe
  # Game AI
  class GameAI
    def initialize(game_board)
      @game_board = game_board
    end

    def turn
      int = available_points.sample
      @game_board.point_set(int, @ai_char)
      sleep 1
    end

    def available_points
      points = []
      @game_board.board.each_with_index do |b, index|
        points << index + 1 if b.eql?('')
      end
      points
    end

    def init_char(char)
      @ai_char = char
    end
  end
end
