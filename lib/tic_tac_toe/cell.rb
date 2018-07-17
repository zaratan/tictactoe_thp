# frozen_string_literal: true

module TicTacToe
  class Cell
    attr_reader :number, :value

    def initialize(number)
      raise "Invalid cell number" if number < 1 || number > 9
      @number = number
    end

    def to_s
      (value || number).to_s.capitalize
    end

    def inspect
      "(#{number}: #{value})"
    end

    def value=(val)
      raise "Already a symbol here" if @value
      @value = val
    end
  end
end
