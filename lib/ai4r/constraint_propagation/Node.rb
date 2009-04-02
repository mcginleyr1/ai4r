class Node
	attr_accessor :possiblevalues, :edges

	def initialize( startvalue, endvalue )
		:possiblevalues << (starvalue..endvalue)
	end

	def reducedomain
		@edges.each do |anedge| 

		end
	end
end
