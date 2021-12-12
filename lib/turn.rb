class Turn
  attr_reader :play,
              :user_cruiser_coords,
              :user_sub_coords

  def initialize
    @play = play
    @user_cruiser_coords = nil
    @user_sub_coords = nil
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

end
