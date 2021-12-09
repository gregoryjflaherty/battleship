require 'pry'
require './lib/cell'
require './lib/ship'

class Board
  attr_reader :cells

  def initialize
    coordinate_arr = %w( A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4 )

    @cells = Hash.new { |hash, key| hash[key] = nil}

    coordinate_arr.each do |coordinate|
      @cells[coordinate] = Cell.new(coordinate)
    end

  end
end
