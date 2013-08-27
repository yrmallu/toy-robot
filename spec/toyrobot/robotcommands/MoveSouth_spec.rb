require './toyrobot/robotcommands/Command'
require './toyrobot/robotcommands/MoveSouth'
require './table/TableTop'
require './table/TablePosition'
require './toyrobot/Direction'
require './toyrobot/Robot'

describe 'RobotCommands::MoveSouth' do
  let(:robot) { Robot.new(Direction.new.face(:SOUTH), TablePosition.new(1,1)) }

  it 'Moves robot SOUTH' do
    RobotCommands::MoveSouth.new(robot, TableTop.new).execute
    robot.position.y.should eq(0)
  end
end