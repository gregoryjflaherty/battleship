require 'pry'
require './lib/cell'
require './lib/ship'

class Board
  attr_reader :cells

  def initialize
    letters = %w( A B C D )
    @cells = Hash.new { |hash, key| hash[key] = nil}
    letters.each do |letter|
      4.times do |num|
        @cells["#{letter}#{num + 1}"] = Cell.new("#{letter}#{num + 1}")
      end
    end
  end
end
