class Node
	attr_accessor :values, :inputs, :outputs

	def initialize( startvalue, endvalue )
		:values << (starvalue..endvalue)
	end

	def add_output( righthandnode, edgetype )
		edgetype.new( self, righthandnode )
	end

	def add_input( lefthandnode, edgetype )
		edgetype.new( lefthandnode, self )
	end
end
