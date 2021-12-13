
=begin
require './lib/comp'

RSpec.describe Turn do

  it 'exists' do
    new_turn = Turn.new

    expect(new_turn).to be_an_instance_of(Turn)
  end

  it 'greets' do
    new_turn = Turn.new

    expect(new_turn.welcome).to eq("Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.")
  end

  it 'gives directions' do
    new_turn = Turn.new

    expect(new_turn.welcome).to eq("I have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long.\n  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \nEnter the squares for the Cruiser (3 spaces):")
  end
end
=end
