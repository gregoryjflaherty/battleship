require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/comp"


class Turn
  attr_reader :play,
              :user_cruiser,
              :user_submarine,
              :comp_cruiser,
              :comp_submarine,
              :computer,
              :user_board,
              :shot,
              :comp_shot

  def initialize
    @play      = play
    @shot      = shot
    @comp_shot = comp_shot
  end

  def setup #2nd
    board_choice == 'y' ? @user_board = Board.new : @user_board = Board.new(4, ("A".."D").to_a)
    @computer    = Computer.new(@user_board.length, @user_board.height)
    @user_cruiser   = Ship.new("Cruiser", 3)
    @user_submarine = Ship.new("Submarine", 2)
    @comp_cruiser   = Ship.new("Cruiser", 3)
    @comp_submarine = Ship.new("Submarine", 2)
    @computer.assign_to_cells(@comp_cruiser) #Random assignment
    @computer.assign_to_cells(@comp_submarine) #Random assignment
  end

  def welcome_direct #1st
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    @play = gets.chomp
  end

  def board_choice
    puts "Do you want to choose your board size?"
    puts "A 'No' answer will default to a 4 x 4 size."
    puts "Enter y for yes. Enter n for no."
    choice = gets.chomp
    choice
  end


  def place_direct #3rd
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."#concatenate later
  end

  def user_place(ship) #will need to run 2x in runner (once per ship)
    puts @user_board.render(true) #show board
    puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
    coordinates = gets.chomp.split(' ')
    while @user_board.valid_placement?(ship, coordinates) == false
      puts "Those are invalid coordinates. Please try again:"
      coordinates = gets.chomp.split(' ')
    end
    @user_board.place(ship, coordinates)
  end

  def show_board
    puts "=============COMPUTER BOARD============="
    puts @computer.board.render
    puts "==============PLAYER BOARD=============="
    puts @user_board.render(true) #Why is this returning nil
  end

  def user_shot #1st
    valid = false
    puts "Enter the coordinate for your shot:"
    @shot = gets.chomp
    valid = valid_shot?(@shot)

    while valid == false
      puts "Please enter a valid coordinate:"
      @shot = gets.chomp
      valid = valid_shot?(@shot)
    end
    @computer.board.cells[@shot].fire_upon
  end

  def valid_shot?(coordinate)
    @computer.board.valid_coordinate?(coordinate) == true && @computer.board.cells[coordinate].fired_upon? == false
  end

  def computer_shot #2nd #computer's shot is only invalid if repeated
    valid = false
    while valid == false
      @comp_shot = @computer.random_coordinate
      if @user_board.cells[@comp_shot].fired_upon? == false
        @user_board.cells[@comp_shot].fire_upon
        valid = true
      end
    end
  end

  def user_results
    return "Your shot on #{@shot} was a miss." if @computer.board.cells[@shot].empty? == true
    return "Your shot on #{@shot} was a hit and sunk my ship." if @computer.board.cells[@shot].ship.sunk? == true #refactor goal
    return "Your shot on #{@shot} was a hit." if @computer.board.cells[@shot].empty? == false
  end

  def comp_results
    return "My shot on #{@comp_shot} was a miss." if @user_board.cells[@comp_shot].empty? == true
    return "My shot on #{@comp_shot} was a hit and sunk your ship." if @user_board.cells[@comp_shot].ship.sunk? == true #refactor goal
    return "My shot on #{@comp_shot} was a hit." if @user_board.cells[@comp_shot].empty? == false
  end

  def game_over?
    if @comp_cruiser.sunk? == true && @comp_submarine.sunk? == true
      puts "You won!"
      return true
    elsif @user_cruiser.sunk? == true && @user_submarine.sunk? == true
      puts "I won!"
      return true
    else
      return false
    end
  end

  def game_flow
    welcome_direct
    exit if @play == "q"
    setup
    place_direct
    user_place(@user_cruiser)
    user_place(@user_submarine)

    game_on = true
    while game_on == true
      show_board
      user_shot
      computer_shot
      puts user_results
      puts comp_results
      game_on = !game_over?
    end
    next_game = Turn.new
    next_game.game_flow
  end
end
turn = Turn.new
turn.game_flow
