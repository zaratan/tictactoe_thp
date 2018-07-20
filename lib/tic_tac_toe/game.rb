# frozen_string_literal: true

module TicTacToe
  class Game
    def initialize
      @current_player = :x
      @player_x_name = ''
      @player_o_name = ''
      ask_player_name(:x)
      ask_player_name(:o)
      @board = Board.new
    end

    def play
      1.upto(9) do |turn|
        print "Turn: #{turn}\n"
        take_turn
        break if @winning_player
      end
      print_endgame
      ask_play_again
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

    def ask_play_again
      print "Do you want to play again ? [Y/n] "
      answer = gets.chomp
      print("\n")
      if answer == "" || answer =~ /^Y(es)?/
        print "Awesome! Let's the game begin!\n"
        @board = Board.new
        play
      else
        print "See you later <3\n"
      end
    end

    def play_position(position)
      @board.play(position: position, symbol: @current_player)
    end

    def win?
      @winning_player = @board.win?
    end

    def print_board
      print "Current player: #{current_player_name}. You have the #{@current_player.to_s.capitalize}.\n"
      print @board
      print "\n\n"
    end

    def print_endgame
      if @winning_player
        print "Yay #{@winning_player.to_s.capitalize} won!\n"
      else
        print "No winner :(\n"
      end
    end

    def switch_player
      @current_player =
        @current_player == :x ? :o : :x
    end

    def current_player_name
      instance_variable_get("@player_#{@current_player}_name")
    end

    def ask_player_name(symbol)
      print "Hey new player, you have the #{symbol.to_s.capitalize}. What's your name ?\n"
      instance_variable_set("@player_#{symbol}_name", gets)
      print "Cool! Hello #{instance_variable_get("@player_#{symbol}_name")}"
    end
  end
end
