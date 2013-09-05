module RobotCommands
class Report < RobotCommands::Command
  def initialize(robot)
    super(robot)
  end

  def execute
    puts @robot.position.x.to_s << ',' << @robot.position.y.to_s << ',' + @robot.direction.current_direction.to_s
  end
end
end
