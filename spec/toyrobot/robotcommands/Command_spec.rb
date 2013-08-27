module RobotCommands
class Command
  attr_reader :robot, :tabletop

  def initialize(robot, tabletop = TableTop.new)
	 @robot = robot
   @tabletop = tabletop
  end

  def execute
  end
end
end

