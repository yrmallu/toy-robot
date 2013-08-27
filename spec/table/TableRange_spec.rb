require './table/TableRange'

describe 'TableRange' do
  let(:tablerange) { TableRange.new(0,5) }

  it 'returns true when within range' do
    tablerange.include?(1).should == true
  end

  it 'returns false when outside of range' do
    tablerange.include?(6).should == false
  end
end