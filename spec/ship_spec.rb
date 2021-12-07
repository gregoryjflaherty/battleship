require './lib/ship'

RSpec.describe Ship do

  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_an_instance_of (Ship)
    expect(submarine).to be_an_instance_of (Ship)
  end

  it 'has a name' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.name).to eq("Cruiser")
    expect(submarine.name).to eq("Submarine")
  end

  it 'has a length' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.length).to eq(3)
    expect(submarine.length).to eq(2)
  end

  it 'has health' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.health).to eq(3)
    expect(submarine.health).to eq(2)
  end

  it 'has sunk?' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.sunk?).to be false
  end

  it 'has lost 1 health' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit

    expect(cruiser.health).to eq(2)
  end

  it 'has lost 2 health' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit

    expect(cruiser.health).to eq(1)
  end

  it 'has sunk? after 2 health lost' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit

    expect(cruiser.sunk?).to be false
  end

  it 'has sunk? after 3 health lost' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit
    cruiser.hit

    expect(cruiser.sunk?).to be true
  end

end
