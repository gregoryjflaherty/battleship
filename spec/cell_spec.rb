require './lib/cell'
require './lib/ship'

RSpec.describe Cell do
  it 'exists with arguments' do
    cell = Cell.new('B4')
    
    expect(cell).to be_an_instance_of(Cell)
  end
end
