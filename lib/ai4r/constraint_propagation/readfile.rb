require 'stack_propagate'
#require 'Node.rb'
#require 'set'

propagate = StackPropagate.new
file = File.open( 'nodes' )
lines = file.readlines
lines.each do |singleline|
	attributes = singleline.split ' ' 
	propagate.add_node( attributes[0], attributes[1], attributes[2] )
end

file = File.open( 'edges' )
lines = file.readlines
lines.each do | singleline|
	constraintinfo = singleline.split ' '
	propagate.add_edge_between_nodes( constraintinfo[0], constraintinfo[2], constraintinfo[1] )
end

propagate.begin_propagation
