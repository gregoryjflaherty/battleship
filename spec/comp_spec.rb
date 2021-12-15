require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/comp"


RSpec.describe Computer do
  it 'exists' do
    computer = Computer.new

    expect(computer).to be_an_instance_of(Computer)
  end

  it 'has a board' do
    computer = Computer.new

    expect(computer.board.cells).to be_a(Hash)
    expect(computer.board.cells.size).to eq(16)
  end

  it 'generates ship coordinates' do
    computer  = Computer.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(computer.rand_place_ship(cruiser).length).to be(3)
    expect(computer.board.valid_placement?(cruiser, (computer.rand_place_ship(cruiser)))).to be(true)

    expect(computer.rand_place_ship(submarine).length).to be(2)
    expect(computer.board.valid_placement?(submarine, (computer.rand_place_ship(submarine)))).to be(true)
  end
end
