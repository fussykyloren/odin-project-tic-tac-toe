# lib/tic_tac_toe.rb

require_relative "tic_tac_toe/version"

module TicTacToe
  class Error < StandardError; end
  # Your code goes here...
end

require_relative './tic_tac_toe/cell.rb'
require_relative './tic_tac_toe/player.rb'
require_relative './tic_tac_toe/board.rb'
require_relative './tic_tac_toe/core_extensions.rb'
require_relative './tic_tac_toe/game.rb'