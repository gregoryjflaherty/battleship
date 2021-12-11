require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/comp"
require "./lib/turn"

RSpec.describe Computer do #Check class name with Greg
  it 'exists' do
    computer = Computer.new

    expect(computer).to be_an_instance_of(Computer)
  end

  it 'has ships' do
    computer = Computer.new

    expect(computer.cruiser).to be_an_instance_of(Ship)
    expect(computer.submarine).to be_an_instance_of(Ship)
  end

  it 'has a board' do
    computer = Computer.new

    expect(computer.board.cells).to be_a(Hash)
    expect(computer.board.cells.size).to eq(16)
  end

  it 'generates ship coordinates' do
    computer  = Computer.new
    expect(computer.rand_place_ship(computer.cruiser).length).to be(3)
    expect(computer.board.valid_placement?(computer.cruiser, (computer.rand_place_ship(computer.cruiser)))).to be(true)

    expect(computer.rand_place_ship(computer.submarine).length).to be(2)
    expect(computer.board.valid_placement?(computer.submarine, (computer.rand_place_ship(computer.submarine)))).to be(true)
  end

  # it 'takes a valid shot' do
  #   computer  = Computer.new
  #
  # end
end
