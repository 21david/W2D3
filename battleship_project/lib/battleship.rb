require_relative "board"
require_relative "player"

class Battleship
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    attr_reader :board, :player

    def start_game
        @board.place_random_ships
        puts "ships placed: #{@board.size / 4}"
        puts "remaining misses: #{@remaining_misses}"
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts 'you lose.'
            return true
        end
        false
    end

    def win?
        if @board.num_ships == 0
            puts 'you win!!!!'
            return true
        end
        false
    end

    def game_over?
        if win? || lose?
            return true
        end
        false
    end

    def turn
        spot = @player.get_move

        if !@board.attack(spot)
            @remaining_misses -= 1
        end

        @board.print
        puts "remaining misses: #{@remaining_misses}"
    end
end
