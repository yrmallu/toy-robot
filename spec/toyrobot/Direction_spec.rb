require './lib/toyrobot/Direction.rb'

describe Direction do
  let(:direction) { Direction.new.face(:NORTH) }

  it "Current direction should be same as specified direction to face during construction" do
    direction.currentdirection.should eq(:NORTH)
  end

  describe '#face' do
    it "throws standard exception when we try to face an invalid direction" do
      expect {direction.face(:EASTY) }.to raise_error(StandardError)
    end

    it "face specified valid direction" do
      direction = Direction.new.face(:EAST)
      direction.currentdirection.should eq(:EAST)
    end
  end

  describe '#turnleft' do
    it "changes the current direction to the left, NORTH to WEST" do
      direction.turnleft
      direction.currentdirection.should eq(:WEST)
    end
  end

  describe '#turnright' do
    it "turn right, makes direction change to the right, from NORTH to EAST" do
      direction.turnright
      direction.currentdirection.should eq(:EAST)
    end
  end

  it "turn right then left, facing should remain the same" do
    direction.turnright
    direction.turnleft
    direction.currentdirection.should eq(:NORTH)
  end

  it "turn left then right, facing should remain the same" do
    direction.turnleft
    direction.turnright
    direction.currentdirection.should eq(:NORTH)
  end
end
