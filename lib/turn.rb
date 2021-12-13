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
              :user_board

  def initialize
    @play = play
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

  def game_flow
    setup
    welcome_direct
    place_direct
    user_place(@user_cruiser)
    user_place(@user_submarine)
    show_board
  end
end
turn = Turn.new
turn.game_flow
