require './lib/board'

class Computer
  attr_reader :board, :cruiser, :submarine

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def random_coordinate
    @board.cells.values.sample.coordinate
  end

  def random_direction
    rand_num = rand(1..2)
    rand_num == 1 ? :horizontal : :vertical
  end


  def horizontal_array(rand_coordinate, ship)
    coordinates = []
    ship.length.times do |i|
      coordinates << "#{rand_coordinate[0]}#{rand_coordinate[1].to_i + i}"
    end
    coordinates
  end

  def vertical_array(rand_coordinate, ship)
    coordinates = []
    ship.length.times do |i|
      ord = rand_coordinate[0].ord + i
      coordinates << "#{ord.chr}#{rand_coordinate[1]}"
    end
    coordinates
  end
end

comp = Computer.new
p comp.vertical_array(comp.random_coordinate, comp.cruiser )
