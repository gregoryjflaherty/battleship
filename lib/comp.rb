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


  def horizontal_array(random_coordinate, ship)
    coordinates = []
    coordinate = random_coordinate
    ship.length.times do |i|
      coordinates << "#{coordinate[0]}#{coordinate[1].to_i + i}"
    end
    coordinates
  end
end

#comp = Computer.new
#p comp.horizontal_array(comp.random_coordinate, comp.cruiser )
