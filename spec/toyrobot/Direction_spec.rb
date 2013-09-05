require './lib/toyrobot/Direction.rb'

describe Direction do
  let(:direction) { Direction.new.face(:NORTH) }

  it "Current direction should be same as specified direction to face during construction" do
    direction.current_direction.should eq(:NORTH)
  end

  describe '#face' do
    it "throws standard exception when we try to face an invalid direction" do
      expect {direction.face(:EASTY) }.to raise_error(StandardError)
    end

    it "face specified valid direction" do
      direction = Direction.new.face(:EAST)
      direction.current_direction.should eq(:EAST)
    end
  end

  describe '#turn_left' do
    it "changes the current direction to the left, NORTH to WEST" do
      direction.turn_left
      direction.current_direction.should eq(:WEST)
    end
  end

  describe '#turn_right' do
    it "turn right, makes direction change to the right, from NORTH to EAST" do
      direction.turn_right
      direction.current_direction.should eq(:EAST)
    end
  end

  it "turn right then left, facing should remain the same" do
    direction.turn_right
    direction.turn_left
    direction.current_direction.should eq(:NORTH)
  end

  it "turn left then right, facing should remain the same" do
    direction.turn_left
    direction.turn_right
    direction.current_direction.should eq(:NORTH)
  end
end
