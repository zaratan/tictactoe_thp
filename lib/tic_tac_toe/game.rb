# frozen_string_literal: true

module TicTacToe
  class Game
    def initialize
      @current_player = :x
      @board = Board.new
    end

    def play
      1.upto(9) do |turn|
        print "Turn: #{turn}\n"
        take_turn
        break if @winning_player
      end
      print_endgame
    end

    def take_turn
      print_board
      position = ask_position
      play_position(position)
      win?
      switch_player
    rescue StandardError => e
      print "#{e.message}\n"
      take_turn
    end

    def ask_position
      print "Where do you want to play ?\n"
      position = gets.to_i
      raise "This is not a valid position" if position.zero?
      position
    end

    def play_position(position)
      @board.play(position: position, symbol: @current_player)
    end

    def win?
      @winning_player = @board.win?
    end

    def print_board
      print "Current player: #{@current_player.to_s.capitalize}\n"
      print @board
      print "\n\n"
    end

    def print_endgame
      if @winning_player
        print "Yay #{@winning_player.to_s.capitalize} won!\n"
      else
        print "No winner :("
      end
    end

    def switch_player
      @current_player =
        @current_player == :x ? :o : :x
    end
  end
end
