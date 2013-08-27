require './table/TablePosition'

describe "Table Position" do
  let(:tableposition) {  TablePosition.new(1,1) }

  it "table position x cord should be the x cord specified on creation" do
    tableposition.x.should eq(1)
  end

  it "table position y cord should be the y cord specified on creation" do
    tableposition.y.should eq(1)
  end

  describe '#increase_y' do
    it "increases y cord by value passed in" do
      tableposition.increase_y(1)
      tableposition.y.should eq(2)
    end
  end

  describe '#decrease_y' do
    it "decreases y cord by value passed in" do
      tableposition.decrease_y(1)
      tableposition.y.should eq(0)
    end
  end

  describe '#increase_x' do
    it "increases x cord by value passed in" do
      tableposition.increase_x(1)
      tableposition.x.should eq(2)
    end
  end

  describe '#decrease_x' do
    it "decreases x cord by value passed in" do
      tableposition.decrease_x(1)
      tableposition.x.should eq(0)
    end
  end
end