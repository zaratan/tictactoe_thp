# frozen_string_literal: true

module TicTacToe
  class Board
    WINNING_DIR = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
    ].freeze

    def initialize
      @cells = Array.new(9) { |i| Cell.new(i + 1) }
    end

    def play(position:, symbol:)
      raise "Out ouf bound position" if position < 1 || position > 9
      @cells[position - 1].value = symbol
    end

    def win?
      winning_direction = WINNING_DIR.find do |direction|
        @cells[direction[0]].value == @cells[direction[1]].value &&
          @cells[direction[0]].value == @cells[direction[2]].value
      end
      winning_direction && @cells[winning_direction.first].value
    end

    def to_s
      ["| #{@cells[0..2].join(' | ')} |",
       "| #{@cells[3..5].join(' | ')} |",
       "| #{@cells[6..8].join(' | ')} |"].join("\n")
    end
  end
end
