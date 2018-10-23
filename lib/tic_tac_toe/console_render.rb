# frozen_string_literal: true

module TicTacToe
  # Colorize console module
  module ConsoleRender
    def render_hello
      render "TicTacToe Game\n".style(:blue, :bold)
    end

    def render_choose_text
      render 'Please Choose:'.style(:yellow) + 'X - 1; O - 2'.style(:yellow)
    end

    def render_help
      render "Please type num: 1 - 9\n".style(:yellow)
    end

    def render_cursor
      $stdout.print "\t-> ".style(:bold, :yellow)
    end

    def render_winner(char)
      render 'Win: ' + char.style(:bold, :yellow)
    end

    def render_error
      render ''
      render 'ERROR'.style(:bold, :red)
    end

    def cell_text(id, data)
      if data.eql?('')
        id.to_s.style(:white, :underline)
      elsif data.eql?(TicTacToe::GameBoard::X_CHAR)
        data.to_s.style(:cyan, :bold)
      else
        data.to_s.style(:magenta, :bold)
      end
    end

    def render_row(num, nums)
      render ' ' +
             cell_text(num, nums[0]) + ' ║ ' +
             cell_text(num + 1, nums[1]) + ' ║ ' + cell_text(num + 2, nums[2])
    end

    def render_board(board)
      render_row(1, board[0..2])
      render '═══╬═══╬═══'
      render_row(4, board[3..5])
      render '═══╬═══╬═══'
      render_row(7, board[6..8])
      render ''
    end

    private

    def render(text)
      $stdout.puts "\t" + text
    end
  end
end
