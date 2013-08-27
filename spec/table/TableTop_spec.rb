require './table/TableRange'
require './table/TableTop'
require './table/TablePosition'

describe 'TableTop' do
  let(:tabletop) { TableTop.new }

  describe '#position_on_table?' do
    it 'returns true if position is on table' do
      tableposition = TablePosition.new(0,0)
      tabletop.position_on_table?(tableposition).should == true
    end

    it 'returns false if position is off the table on the x axis' do
      tableposition = TablePosition.new(6,0)
      tabletop.position_on_table?(tableposition).should == false
    end

    it 'returns false if position is off the table on the y axis' do
      tableposition = TablePosition.new(6,0)
      tabletop.position_on_table?(tableposition).should == false
    end
  end

end
