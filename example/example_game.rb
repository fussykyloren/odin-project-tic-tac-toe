# example/example_game.rb
root = File.expand_path("../", File.dirname(__FILE__))
require "#{root}/lib/tic_tac_toe.rb"

puts "Welcome to Tic-Tac-Toe!"
kylo = TicTacToe::Player.new({color: "X", name: "Kylo"})
rey = TicTacToe::Player.new({color: "O", name: "Rey"})
players = [kylo, rey]
game = TicTacToe::Game.new(players).play