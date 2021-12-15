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

  it 'places a ship' do
    cell = Cell.new('B4')
    cruiser = Ship.new('Cruiser', 3)
    cell.place_ship(cruiser)

    expect(cell.ship).to be(cruiser)
    expect(cell.empty?).to be(false)
  end

  it 'can be fired upon' do
    cell = Cell.new('B4')
    cruiser = Ship.new('Cruiser', 3)
    cell.place_ship(cruiser)

    expect(cell.fired_upon?).to be(false)
  end

  it 'can be hit' do
    cell = Cell.new('B4')
    cruiser = Ship.new('Cruiser', 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.fired_upon?).to be(true)
    expect(cell.ship.health).to be(2)
  end

  it 'can render' do
    cell_1 = Cell.new('B4')

    expect(cell_1.render).to eq('.')
  end

  it 'can show if missed' do
    cell_1 = Cell.new('B4')
    cell_2 = Cell.new('A1')
    cruiser = Ship.new('Cruiser', 3)
    cell_2.place_ship(cruiser)
    cell_1.fire_upon

    expect(cell_1.render).to eq('M')
  end

  it 'can show if has ship' do
    cell_2 = Cell.new('C3')
    cruiser = Ship.new('Cruiser', 3)
    cell_2.place_ship(cruiser)

    expect(cell_2.render).to eq('.')
    expect(cell_2.render(true)).to eq('S')
  end

  it 'can show if hit' do
    cell_2 = Cell.new('C3')
    cruiser = Ship.new('Cruiser', 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon

    expect(cell_2.render).to eq('H')
    expect(cruiser.sunk?).to eq(false)
  end

  it 'can show if sunk' do
    cell_2 = Cell.new('C3')
    cruiser = Ship.new('Cruiser', 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    cruiser.hit
    cruiser.hit

    expect(cell_2.render).to eq('X')
    expect(cruiser.sunk?).to eq(true)
  end
end
