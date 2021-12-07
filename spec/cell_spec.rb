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
end
