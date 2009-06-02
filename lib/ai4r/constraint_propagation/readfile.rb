require 'StackPropagate.rb'
#require 'Node.rb'
#require 'set'

propagator = StackPropagator.new
file = File.open( 'nodes' )
lines = file.readlines
lines.each do |singleline|
	attributes = singleline.split ' ' 
	propagator.add_node( attributes[0], attributes[1], attributes[2] )
end

file = File.open( 'edges' )
lines = file.readlines
lines.each do | singleline|
	constraintinfo = singleline.split ' '
	propagator.add_edge_between_nodes( constraintinfo[0], constraintinfo[1], constraintinfo[2] )
end
