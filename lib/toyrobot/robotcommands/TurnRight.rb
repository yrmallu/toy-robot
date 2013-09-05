module RobotCommands
class TurnRight < RobotCommands::Command
  def initialize(robot)
    super(robot, TableTop.new)
  end

  def execute
    @robot.direction.turn_right
  end
end
end
