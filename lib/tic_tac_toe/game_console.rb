# frozen_string_literal: true

module TicTacToe
  # Console app
  class GameConsole
    include ConsoleRender

    def initialize(game)
      @game = game
    end

    def run
      start_game
      loop do
        loop_game
        break if @game.game_board.win_any?

        clear
        render_hello
      end

      end_game
    end

    private

    def start_game
      clear
      render_hello
      render_choose_text
      choose
    end

    def end_game
      clear
      render_hello
      render_board(@game.game_board.board)
      render_winner(@game.game_board.winner)
    end

    def loop_game
      render_board(@game.game_board.board)
      render_help
      render_cursor
      @game.user_turn point_input
      @game.ai_turn
    end

    # Get num from 1 to 9
    def point_input
      $stdin.gets.chomp.to_i
    end

    # def char_in
    #   system('stty raw -echo')
    #   $stdin.getc
    # ensure
    #   system('stty -raw echo')
    # end

    def choose
      @game.init_user(point_input)
    end

    # Clear console
    def clear
      system 'clear'
    end
  end
end
