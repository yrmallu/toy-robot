module RobotCommands
class MoveRobot < RobotCommands::Command
  def initialize(robot, tabletop)
    super(robot, tabletop)
  end

  def execute
    case @robot.direction.current_direction
    when :NORTH
      RobotCommands::MoveNorth.new(@robot, @tabletop).execute
    when :SOUTH
      RobotCommands::MoveSouth.new(@robot, @tabletop).execute
    when :EAST
      RobotCommands::MoveEast.new(@robot, @tabletop).execute
    when :WEST
      RobotCommands::MoveWest.new(@robot, @tabletop).execute
    else
      #nothing
    end
  end
end
end
