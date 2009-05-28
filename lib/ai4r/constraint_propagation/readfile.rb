require 'StackPropagator.rb'
require 'Node.rb'
require 'set'

propagator = StackPropagator.new
file = File.open( 'nodes' )
lines = file.readlines
lines.each do |singleline|
	attributes = singleline.split ' ' 
	propagator.add_node( attributes[0], attributes[1], attributes[2] )
end

