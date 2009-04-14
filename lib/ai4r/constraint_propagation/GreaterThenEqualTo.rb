class GreaterThenEqualTo<Edge
	def initialize 
		@inequalifty = '>='
	end
	
	def initalize( lefthand, righthand )
		@leftnode = lefthand
		@rightnode = righthand
		@inequality = '>='
	end

	def reducedomain
		if( not @leftnode.values.first @inequality @rightnode.values.last )
			@leftnode.values = Range.new( 0, 0 )
		end
		while( not @leftnode.values.first @inequality @rightnode.values.first )
			@lefttnode.values = self.removefront @lefttnode.values 
		end

		while( not @leftnode.values.last @inequality @rightnode.values.last
			@rightnode.values = self.removeback @rightnode.values
		end
	end
end
