require './lib/cell'
require './lib/ship'

RSpec.describe Cell do
  it 'exists with arguments' do
    cell = Cell.new('B4')

    expect(cell).to be_an_instance_of(Cell)
  end

  it 'has a coordinate' do
    cell = Cell.new('B4')

    expect(cell.coordinate).to eq('B4')
  end

  it 'can hold a ship' do
    cell = Cell.new('B4')

    expect(cell.ship).to be(nil)
  end

  it 'place a ship' do
    cell = Cell.new('B4')
    cruiser = Ship.new('Cruiser', 3)
    cell.place_ship(cruiser)

    expect(cell.ship).to be(cruiser)
    expect(cell.empty?).to be(false)
  end
end
