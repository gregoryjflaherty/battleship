require './lib/board'

class Computer
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def random_coordinate
    @board.cells.values.sample.coordinate
  end

  def random_direction
    rand_num = rand(1..2)
    rand_num == 1 ? :horizontal : :vertical
  end

  def pick_direction(ship)
    if random_direction == :vertical
      vertical_array(random_coordinate, ship.length)
    else
      horizontal_array(random_coordinate, ship.length)
    end
  end


  def horizontal_array(rand_coordinate, ship_length)
    coordinates = []
    ship_length.times do |i|
      coordinates << "#{rand_coordinate[0]}#{rand_coordinate[1].to_i + i}"
    end
    coordinates
  end

  def vertical_array(rand_coordinate, ship_length)
    coordinates = []
    ship_length.times do |i|
      ord = rand_coordinate[0].ord + i
      coordinates << "#{ord.chr}#{rand_coordinate[1]}"
    end
    coordinates
  end

  def rand_place_ship(ship)
    valid = false
    while valid == false
      coordinates = pick_direction(ship)
      if coordinates.all? {|coordinate| @board.valid_coordinate?(coordinate)}
        if @board.valid_placement?(ship, coordinates) == true
          valid = true
        end
      end
    end
    coordinates
  end

  def assign_to_cells(ship)
    coordinates = rand_place_ship(ship)
    @board.place(ship, coordinates)
  end
end
