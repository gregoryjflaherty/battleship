class Turn
  attr_reader :play

  def initialize
    @play = play
  end

    def setup
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

  def welcome
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    @play = gets.chomp
  end

  def

  end

end
