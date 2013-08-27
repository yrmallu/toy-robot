toy-robot-simulation
====================

Description:
  * The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
  * There are no other obstructions on the table surface.
  * The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

  * Create an application that can read in commands of the following form -
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT

  * PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST. 
  * The origin (0,0) can be considered to be the SOUTH WEST most corner.
  * The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.
  * MOVE will move the toy robot one unit forward in the direction it is currently facing.
  * LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
  * REPORT will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.

  * A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT and REPORT commands.
  * Input can be from a file, or from standard input, as the developer chooses.
  * Provide test data to exercise the application.

##Constraints:
The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot. 
Any move that would cause the robot to fall must be ignored.

###Example Input and Output:
a)
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH

b)
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST

c)
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH

## Usage
Run ruby ToyRobotSimulator.rb
Toy robot simulator will read from STDIN. It will time out if you do not type anything and exit. Alternatively you can type the command 'quit'.

## Specs
Run from the main directory rspec spec/

## licence
toy-robot-simulation is licensed under the GNU Lesser General Public License.

### why the LGPL?
The GPL is specifically designed to reduce the usefulness of GPL-licensed code to closed-source, proprietary software. The BSD license (and similar) do not mandate code-sharing if the BSD-licensed code is modified by licensees. The LGPL achieves the best of both worlds: an LGPL-licensed library can be incorporated within closed-source proprietary code, and yet those using an LGPL-licensed library are required to release source code to that library if they change it.


##Some thoughts
Where do we keep the "directions". Right now we have 4. North, south, east, west. We could use degrees right from the start and translate to 90 being east, 180 south etc. Could make it easily extendable in the future.

It's a simple program but allows for numerous aproaches and some interesting things to think about if your trying to write some nice code.

The main part of my code I'm not convinced is great are the direction values e.g. @directions = [:NORTH, :EAST, :SOUTH, :WEST] in the Direction class and then having them in the MoveRobot class in a case statement.
