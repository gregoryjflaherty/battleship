class Turn
  attr_reader :play

  def initialize
    @play = play
  end

  def welcome
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    @play = gets.chomp
  end

end
