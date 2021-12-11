require './lib/board'

class Computer
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
    random_direction == 1 ? :horizontal : :vertical
  end
end
comp = Computer.new
p comp.random_coordinate
p comp.random_direction
