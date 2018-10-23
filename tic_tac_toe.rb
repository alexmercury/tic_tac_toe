# frozen_string_literal: true

require 'concolor'
require_relative 'lib/tic_tac_toe/exceptions'
require_relative 'lib/tic_tac_toe/game_ai'
require_relative 'lib/tic_tac_toe/game_board'
require_relative 'lib/tic_tac_toe/game'
require_relative 'lib/tic_tac_toe/console_render'
require_relative 'lib/tic_tac_toe/game_console'

# app base module
module TicTacToe
  module_function

  # Stat Game
  def run
    Game.start
  end
end

TicTacToe.run
