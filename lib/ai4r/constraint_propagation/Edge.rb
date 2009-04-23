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

	def removefront(arange)
		Range.new(arange.first + 1, arange.last)
	end

	def removeback(arange)
		Range.new(arange.first, arange.last - 1)
	end
end
