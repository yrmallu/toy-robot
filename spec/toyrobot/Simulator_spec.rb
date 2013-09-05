require 'rspec'
require 'spechelper'
require './lib/toyrobot/Simulator'
require './lib/toyrobot/robotcommands/Command'
require './lib/toyrobot/robotcommands/MoveEast'
require './lib/toyrobot/robotcommands/MoveNorth'
require './lib/toyrobot/robotcommands/MoveRobot'
require './lib/toyrobot/robotcommands/MoveSouth'
require './lib/toyrobot/robotcommands/MoveWest'
require './lib/toyrobot/robotcommands/TurnLeft'
require './lib/toyrobot/robotcommands/TurnRight'
require './lib/toyrobot/robotcommands/Report'
require './lib/toyrobot/Direction'
require './lib/table/TableTop'
require './lib/table/TablePosition'
require './lib/toyrobot/Robot'

describe 'Simulator' do
  let(:simulator) { Simulator.new }

  it 'ignores an invalid command' do
    allow_message_expectations_on_nil
    simulator.processline('bob').should_not_receive(:write)
  end

  it 'ignores a place command if the position is off the table' do
    allow_message_expectations_on_nil
    simulator.processline('PLACE 10,1,NORTH')
    simulator.processline('REPORT').should_not_receive(:write)
  end

  it 'places robot on table when valid place command issued' do
    simulator.processline('PLACE 1,1,NORTH')
    output = capture_stdout { simulator.processline('REPORT') }
    output.should == "1,1,NORTH\n"
  end

  describe 'robot has not been placed on table' do
    it 'ignores move command' do
      allow_message_expectations_on_nil
      simulator.processline('MOVE')
      simulator.processline('REPORT').should_not_receive(:write)
    end

    it 'ignores left command' do
      allow_message_expectations_on_nil
      simulator.processline('LEFT')
      simulator.processline('REPORT').should_not_receive(:write)
    end

    it 'ignores right command' do
      allow_message_expectations_on_nil
      simulator.processline('RIGHT')
      simulator.processline('REPORT').should_not_receive(:write)
    end

    it 'ignores place command' do
      allow_message_expectations_on_nil
      simulator.processline('PLACE 1,1,NORTHY')
      simulator.processline('REPORT').should_not_receive(:write)
    end
  end

  describe 'robot has been placed on table' do
    before do
      simulator.processline('PLACE 1,1,NORTH')
    end

    it 'prints out current position and direction when report command issued' do
      output = capture_stdout { simulator.processline('REPORT') }
      output.should == "1,1,NORTH\n"
    end

    it 'moves robot on table when move command is issued' do
      simulator.processline('MOVE')
      output = capture_stdout { simulator.processline('REPORT') }
      output.should == "1,2,NORTH\n"
    end

    it 'turns robot to the left when left command issued' do
      simulator.processline('LEFT')
      output = capture_stdout { simulator.processline('REPORT') }
      output.should == "1,1,WEST\n"
    end

    it 'turns robot to the right when right command issued' do
      simulator.processline('RIGHT')
      output = capture_stdout { simulator.processline('REPORT') }
      output.should == "1,1,EAST\n"
    end

    it 'ignores move command when the robot would have moved off the table' do
      for i in 0..5 do
        simulator.processline('MOVE')
      end

      output = capture_stdout { simulator.processline('REPORT') }
      output.should == "1,4,NORTH\n"
    end

    it '*scenario results in 0,0,WEST* place 0,0,north, left, report output is 0,0,west' do
      simulator.processline('PLACE 0,0,NORTH')
      simulator.processline('LEFT')
      output = capture_stdout { simulator.processline('REPORT') }
      output.should == "0,0,WEST\n"
    end

    it '*scenario results in 0,1,NORTH* place 0,0,north move report output is 0,1,north' do
      simulator.processline('PLACE 0,0,NORTH')
      simulator.processline('MOVE')
      output = capture_stdout { simulator.processline('REPORT') }
      output.should == "0,1,NORTH\n"
    end

    it '*scenario results in 3,3,NORTH* place,1,2,east move move left move report output 3,3,North' do
      simulator.processline('PLACE 1,2,EAST')
      simulator.processline('MOVE')
      simulator.processline('MOVE')
      simulator.processline('LEFT')
      simulator.processline('MOVE')
      output = capture_stdout { simulator.processline('REPORT') }
      output.should == "3,3,NORTH\n"
    end

    it 'resets the position based ont he last valid place command issued' do
      simulator.processline('PLACE 0,0,NORTH')
      simulator.processline('MOVE')
      simulator.processline('MOVE')
      simulator.processline('LEFT')
      simulator.processline('MOVE')
      simulator.processline('PLACE 0,0,NORTH')
      output = capture_stdout { simulator.processline('REPORT') }
      output.should == "0,0,NORTH\n"
    end

    it 'ingnores an invalid place command' do
      allow_message_expectations_on_nil
      simulator.processline('PLACE 0,0,NORTH')
      simulator.processline('MOVER').should_not_receive(:write)
    end
  end

  describe '#place' do
    it 'raises aunsuccessful place command raises standard error' do
      expect { simulator.place(1,1,1) }.to raise_error(StandardError)
    end
  end

  describe '#move' do
    it 'to a valid place on the table' do
      simulator.processline('PLACE 1,1,NORTH')
      simulator.move
      output = capture_stdout { simulator.report }
      output.should == "1,2,NORTH\n"
    end

    it 'off the table is ignored' do
      simulator.processline('PLACE 0,0,SOUTH')
      simulator.move
      output = capture_stdout { simulator.report }
      output.should == "0,0,SOUTH\n"
    end

    it 'ignores if robot has not been placed by raising an exception' do
      expect { simulator.move }.to raise_error(StandardError)
    end
  end

  describe '#report' do
    it 'prints out report message 1,1,SOUTH' do
      simulator.processline('PLACE 1,1,SOUTH')
      output = capture_stdout { simulator.report }
      output.should == "1,1,SOUTH\n"
    end
  end

  describe '#right' do
    it 'turns the robot to the right' do
      simulator.processline('PLACE 1,1,SOUTH')
      simulator.right
      output = capture_stdout { simulator.report }
      output.should == "1,1,WEST\n"
    end
  end

  describe '#left' do
    it 'turns the robot to the left' do
      simulator.processline('PLACE 1,1,SOUTH')
      simulator.left
      output = capture_stdout { simulator.report }
      output.should == "1,1,EAST\n"
    end
  end
end
