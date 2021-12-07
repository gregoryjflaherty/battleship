require './lib/ship'

RSpec.describe Ship do

  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_an_instance_of (Ship)
  end

  it 'has a name' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.name).to eq("Cruiser")
  end

  it 'has a length' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.length).to eq(3)
  end

  it 'has health' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.health).to eq(3)
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

end
