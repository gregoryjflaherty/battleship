require 'pry'
require './lib/cell'
require './lib/ship'

class Board
  attr_reader :cells

  def initialize
    letters = %w( A B C D )#.values_at method
    @cells = Hash.new { |hash, key| hash[key] = nil}
    letters.each do |letter|
      4.times do |num|
        @cells["#{letter}#{num + 1}"] = Cell.new("#{letter}#{num + 1}")
      end
    end
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, coord_array)
    if coord_array.length == ship.length && equal_letters?(coord_array)
      nums_increase_1(coord_array)
    elsif coord_array.length == ship.length
      #
      #
        #
        #
    else
      false #Ship length is not correct
    end
  end

  def equal_letters?(coord_array)
    coord_array.all? {|coord|coord[0] == coord_array[0][0]}
  end

  def nums_increase_1?(coord_array)
    compare = coord_array.map {|coord| coord[-1].to_i} #fails if coordinate>12
    compare.each_cons(2).all? {|x,y| y == x+1}
  end

end
