class Edge
	attr_accessor :inequality, :lefthandnode, :righthandnode

	def initialize( lefthand, righthand )
		@lefthandnode = lefthand
		@righthandnode = righthand
	end

	def removefromranges
	end
end
