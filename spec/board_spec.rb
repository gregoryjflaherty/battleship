require "./lib/board"

RSpec.describe Board do
  it 'exists' do
    board = Board.new
    expect(board).to be_an_instance_of(Board)
  end

  it 'has cells' do
    board = Board.new
    expect(board.cells).to be_a(Hash)
    expect(board.cells.size).to be(16)
  end
end
