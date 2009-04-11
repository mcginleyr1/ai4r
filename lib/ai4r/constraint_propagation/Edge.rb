class Edge
	attr_accessor :inequality, :leftnode, :rightnode

	def initialize( lefthand, righthand )
		@leftnode = lefthand
		@rightnode = righthand
	end

	def reducedomains
	end

	def removefront( arange )
		Range.new( arange.first++, arange.last )
	end

	def removeback( arange )
		Range.new( arange.first, arange.last-- )
	end
end
