class Edge
	attr_accessor :inequality, :leftnode, :rightnode

	def initialize(lefthand, righthand)
		@leftnode = lefthand
		@rightnode = righthand
		@leftnode.outputs.add self
		@rightnode.inputs.add self
	end

	def reducedomains
	end

	def removefront(anode)
		Range.new( anode.values.first + 1, anode.values.last)
	end

	def removeback(anode)
		Range.new( anode.values.first, anode.values.last - 1)
	end
end
