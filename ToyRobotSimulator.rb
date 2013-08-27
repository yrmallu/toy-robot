#!/usr/bin/env ruby
require 'timeout'
require './toyrobot/robotcommands/Command'
require './toyrobot/robotcommands/MoveEast'
require './toyrobot/robotcommands/MoveNorth'
require './toyrobot/robotcommands/MoveRobot'
require './toyrobot/robotcommands/MoveSouth'
require './toyrobot/robotcommands/MoveWest'
require './toyrobot/robotcommands/TurnLeft'
require './toyrobot/robotcommands/TurnRight'
require './toyrobot/robotcommands/Report'
require './toyrobot/Direction'
require './toyrobot/Robot'
require './table/TablePosition'
require './table/TableTop'
require './toyrobot/Simulator'

line = ''
simulator = Simulator.new
puts 'Start'

begin
  while line != "quit\n"
    status = Timeout::timeout(15) do
      line = ARGF.readline
    end
    simulator.processline(line)
  end
rescue Timeout::Error
  puts 'Input timed out.'
end

puts "Bye!"
