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
end
comp = Computer.new
p comp.random_coordinate
