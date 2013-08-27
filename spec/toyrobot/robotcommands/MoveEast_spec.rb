require './toyrobot/robotcommands/Command'
require './toyrobot/robotcommands/MoveEast'
require './table/TableTop'
require './table/TablePosition'
require './toyrobot/Direction'
require './toyrobot/Robot'

describe 'RobotCommands::MoveEast' do
  let(:robot) { Robot.new(Direction.new.face(:EAST), TablePosition.new(1,1)) }

  it 'Moves robot EAST' do
    RobotCommands::MoveEast.new(robot, TableTop.new).execute
    robot.position.x.should eq(2)
  end
end