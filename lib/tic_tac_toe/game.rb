# lib/tic_tac_toe/game.rb

module TicTacToe
    class Game
        attr_reader :players, :board, :current_player, :other_player
        def initialize(players, board = Board.new)
            @players = players
            @board = board
            @current_player, @other_player = players.shuffle
        end

        def switch_players
            @current_player, @other_player = @other_player, @current_player
        end

        def solicit_move
            "#{current_player.name}: Enter a number between 1 and 9 to make your move."
        end

        def get_move(human_move = gets.chomp)
            while !(human_move.is_a? Integer) || board.is_cell_taken(human_move) || Integer(human_move) > 9 || Integer(human_move) < 1
                if Integer(human_move) > 9 || Integer(human_move) < 1
                    puts "#{current_player.name}: Number is not between 1 and 9. Try again!"
                    human_move = gets.chomp
                elsif !(human_move.is_a Integer)
                    puts "#{current_player.name}: Value is not an integer. Enter a number between 1 and 9."
                else
                    puts "#{current_player.name}: Space is not empty. Enter another number between 1 and 9."
                    human_move = gets.chomp
                end
            end
            human_move_to_coord(human_move)
        end

        def game_over_message
            return "#{current_player.name} won! The First Order reigns supreme.." if board.game_over == :winner && current_player.name == "Kylo"
            return "#{current_player.name} won! The Resistance Lives!" if board.game_over == :winner && current_player.name == "Rey"
            return "The game ended in a tie." if board.game_over == :draw
        end

        def play
            puts "#{current_player.name} has randomly been selected as the first player"
            loop do
                board.formatted_grid
                puts ""
                puts solicit_move
                x, y = get_move
                board.set_cell(x, y, current_player.color)
                if board.game_over
                    puts game_over_message
                    board.formatted_grid
                    return
                else
                    switch_players
                end
            end
        end

        private

        def human_move_to_coord(human_move)
            mapping = {
                "1" => [0,0],
                "2" => [1,0],
                "3" => [2,0],
                "4" => [0,1],
                "5" => [1,1],
                "6" => [2,1],
                "7" => [0,2],
                "8" => [1,2],
                "9" => [2,2]
            }
            mapping[human_move]
        end

    end
end