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
              :shot

  def initialize
    @play   = play
    @shot   = shot
  end

  def setup #2nd
    @user_cruiser   = Ship.new("Cruiser", 3)
    @user_submarine = Ship.new("Submarine", 2)
    @comp_cruiser   = Ship.new("Cruiser", 3)
    @comp_submarine = Ship.new("Submarine", 2)
    @computer       = Computer.new
    @user_board     = Board.new

    @computer.assign_to_cells(@comp_cruiser) #Random assignment
    @computer.assign_to_cells(@comp_submarine) #Random assignment
    #
  end

  def welcome_direct #1st
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    @play = gets.chomp
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
    # puts "user shot at #{@shot}"
  end

  def valid_shot?(coordinate)
    @computer.board.cells[coordinate].fired_upon? == false && @computer.board.valid_coordinate?(coordinate) == true
  end

  def computer_shot #2nd #computer's shot is only invalid if repeated
    valid = false
    while valid == false
      comp_shot = @computer.random_coordinate
      if @user_board.cells[comp_shot].fired_upon? == false
        @user_board.cells[comp_shot].fire_upon
        valid = true
      end
    end
    # puts "comp shot at #{comp_shot}"
  end


  def game_flow
    setup
    welcome_direct
    place_direct
    user_place(@user_cruiser)
    user_place(@user_submarine)
    show_board
    user_shot
    computer_shot
    show_board#temp
  end
end
turn = Turn.new
turn.game_flow
