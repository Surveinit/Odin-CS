require_relative "lib/knight"

path =  knight_moves([0,0],[3,3])
moves = path.length

puts "You made it in #{moves} moves!  Here's your path:"
p path