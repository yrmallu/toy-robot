require './lib/toyrobot/robotcommands/Command'
require './lib/toyrobot/robotcommands/MoveSouth'
require './lib/table/TableTop'
require './lib/table/TablePosition'
require './lib/toyrobot/Direction'
require './lib/toyrobot/Robot'

describe 'RobotCommands::MoveSouth' do
  let(:robot) { Robot.new(Direction.new.face(:SOUTH), TablePosition.new(1,1)) }

  it 'Moves robot SOUTH' do
    RobotCommands::MoveSouth.new(robot, TableTop.new).execute
    robot.position.y.should eq(0)
  end
end
