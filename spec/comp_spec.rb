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

    expect(computer.board).to be_a(Hash)
    expect(computer.board).to eq(16)
  end

  it 'generates ship coordinates' do
    computer  = Computer.new
    computer.rand_place_ship(cruiser)
    expect(computer.rand_place_ship(cruiser).length).to be(3)
    expect(computer.rand_place_ship(cruiser).valid_placement?).to be(true)

    computer.rand_place_ship(submarine)
    expect(computer.rand_place_ship(submarine).length).to be(2)
    expect(computer.rand_place_ship(submarine).valid_placement?).to be(true)
  end

  # it 'takes a valid shot' do
  #   computer  = Computer.new
  #
  # end
end
