# frozen_string_literal: true

require_relative 'tic_tac_toe/version'
require_relative 'tic_tac_toe/cell'
require_relative 'tic_tac_toe/board'
require_relative 'tic_tac_toe/game'

module TicTacToe
  def self.play
    Game.new.play
  end
end
