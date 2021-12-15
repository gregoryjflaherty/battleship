require './lib/board'

class Computer
  attr_reader :board,
              :cruiser,
              :submarine,
              :shot_sequence,
              :last_hit,
              :next_hit

  def initialize(length, height)
    @board = Board.new(length, height)
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @shot_sequence = create_shot_sequence(diagonal_up_array, diagonal_down_array)
    @last_hit = nil
    @next_hit = nil
    @horizontal_shot_array = []
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
    @board.height.length.times {|number| numbers << number + 1}
    diagonal = @board.height.zip(numbers)
    diagonal.map {|array| array.join}
  end

  def diagonal_up_array
    numbers = []
    @board.length.times {|number| numbers << number + 1}
    diagonal = @board.height.reverse.zip(numbers)
    diagonal.map {|array| array.join}
  end

  def create_shot_sequence(array_1, array_2)
    array_1.each {|coord| array_2 << coord}
    array_2
  end

  def vertical_sink_pattern(board)
    coord_array = []
    ord = @last_hit[0].ord + 1
    coord_array = ["#{ord.chr}#{@last_hit[-1]}", "#{(ord - 2).chr}#{@last_hit[-1]}"]
    coord_array.map {|coord| coord_array.delete(coord) if board.cells.keys.include?(coord) == false}
    coord_array
  end

  def horizontal_shots(board)
    if board.cells[@horizontal_shot_array[0]].empty? == false && board.cells[@horizontal_shot_array[0]].ship.sunk? == true
      @last_hit = nil
      intelligent_attack(board)
    elsif board.cells[@horizontal_shot_array[0]].fired_upon? == false
      board.cells[@horizontal_shot_array[0]].fire_upon
      @last_hit = @horizontal_shot_array[0]
      @horizontal_shot_array.shift
    elsif board.cells[@horizontal_shot_array[1]].fired_upon? == false
      board.cells[@horizontal_shot_array[1]].fire_upon
      @last_hit = @horizontal_shot_array[1]
      @horizontal_shot_array.pop
    end
  end

  def horizontal_sink_pattern(board)
    num = @last_hit[-1].to_i
    @horizontal_shot_array = ["#{@last_hit[0]}#{num - 1}", "#{@last_hit[0]}#{num + 1}"]
    @horizontal_shot_array.map {|coord| @horizontal_shot_array.delete(coord) if board.cells.keys.include?(coord) == false}
    horizontal_shots(board)
  end

  def start_intelligent_shots(board)
    shot = @shot_sequence.shuffle!.first
    p "look here #{shot} in #{@shot_sequence}"
    board.cells[shot].fire_upon if board.cells.keys.include?(shot) == true
    @last_hit = shot if board.cells[shot].empty? == false
    @shot_sequence.delete(shot)
  end

  def intelligent_attack(board)
    p "last hit - #{@last_hit}"
    if @last_hit == nil
      start_intelligent_shots(board)
    elsif @last_hit != nil
      horizontal_sink_pattern(board)
    else
      puts "Yay"
    end
  end
end


#user_board = Board.new
#computer_board = Computer.new(user_board.length, user_board.height)
#user_submarine = Ship.new("Submarine", 2)
#user_board.place(user_submarine, ["B3", "B4"])
#computer_board.intelligent_attack(user_board)
#p computer_board.last_hit

#p computer_board.intelligent_attack(user_board)


#p computer_board.diagonal_down_array
#p computer_board.diagonal_up_array
#p computer_board.shot_sequence






=begin
user = Board.new
computer = Computer.new(user.length, user.height)
#computer.horizontal_sink_pattern(user)
p computer.vertical_sink_pattern(user)


  def attack(board)
    start_intelligent_shots(board) if @last_hit == nil
  end

  def sink_the_ship(board)
    if horizontal_sink_pattern.length.zero?
      #vertical
    else
      horizontal_sink_pattern[]
  end

  def horizontal_shots(coord_array, board)

  end


  def horizontal_sink_pattern(board)
    coord_array = ["#{@last_hit[0]}#{num}", "#{@last_hit[0]}#{num -2}"]
    coord_array.map {|coord| coord_array.delete(coord) if board.cells.keys.include?(coord) == false}


  end

  def vertical_sink_pattern(board)
    coord_array = []
    ord = @last_hit[0].ord + 1
    coord_array = ["#{ord.chr}#{@last_hit[-1]}", "#{(ord - 2).chr}#{@last_hit[-1]}"]
    coord_array.map {|coord| coord_array.delete(coord) if board.cells.keys.include?(coord) == false}
    coord_array
  end
=end
=begin
def horizontal_shots(board)
  if @next_hit == nil
    @next_hit = "#{@last_hit[0]}#{@last_hit[-1].to_i + 1}" ## EX A3
  end
  board.cells[@next_hit].fire_upon
  if board.cells[@next_hit].ship == nil
    if board.cells["#{@last_hit[0]}#{@last_hit[-1].to_i - 1}"].fired_upon? #A2
      @next_hit = "#{@last_hit[0]}#{@last_hit[-1].to_i - 2}" #A1
    else
      @next_hit = "#{@last_hit[0]}#{@last_hit[-1].to_i - 1}" #A2
    end
  else
    @last_hit = @next_hit #might need to reverse this
  end
end
=end
