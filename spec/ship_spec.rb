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

end
