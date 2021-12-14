require './lib/board'

class Computer
  attr_reader :board, :cruiser, :submarine, :shot_sequence

  def initialize(length, height)
    @board = Board.new(length, height)
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @shot_sequence = diagonal_up_array
  end

  def random_coordinate  #4
    @board.cells.values.sample.coordinate
  end

  def random_direction  #3
    rand_num = rand(1..2)
    rand_num == 1 ? :horizontal : :vertical
  end

  def pick_direction(ship) ### 2nd
    if random_direction == :vertical
      vertical_array(random_coordinate, ship.length)
    else
      horizontal_array(random_coordinate, ship.length)
    end
  end


  def horizontal_array(rand_coordinate, ship_length) ## 3rd
    coordinates = []
    ship_length.times do |i|
      coordinates << "#{rand_coordinate[0]}#{rand_coordinate[1].to_i + i}"
    end
    coordinates
  end

  def vertical_array(rand_coordinate, ship_length) ## 3rd
    coordinates = []
    ship_length.times do |i|
      ord = rand_coordinate[0].ord + i
      coordinates << "#{ord.chr}#{rand_coordinate[1]}"
    end
    coordinates
  end

  def rand_place_ship(ship) ### METHOD FROM TURN -- 1st
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

  def diagonal_down_array
    numbers = []
    @board.length.length.times {|number| numbers << number + 1}
    diagonal = @board.length.zip(numbers)
    diagonal.map {|array| array.join}
  end

  def diagonal_up_array
    numbers = []
    @board.length.times {|number| numbers << number + 1}
    diagonal = @board.height.reverse.zip(numbers)
    diagonal.map {|array| array.join}
  end

  def start_intelligent_shots(board)
    @shot_sequence.shuffle!
    board.cells[@shot_sequence.first].fire_upon
    @shot_sequence.delete(@shot_sequence.first)
  end
end

=begin
user = Board.new
p user.length
p user.height
computer = Computer.new(user.length, user.height)

p computer.shot_sequence
p computer.start_intelligent_shots(user)
p computer.shot_sequence
=end
