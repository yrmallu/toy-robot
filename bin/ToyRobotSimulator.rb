#!/usr/bin/env ruby
require 'timeout'
require './lib/toyrobot_simulation'

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
