class GreaterThenEqualTo<Edge
	def initialize 
		@inequality = lambda { | a, b | a >= b }
	end
	
	def initialize(lefthand, righthand)
		@leftnode = lefthand
		@rightnode = righthand
		@inequality = lambda { | a, b | a >= b }
	end

	def reducedomains
		if( not @inequality.call @leftnode.values.first, @rightnode.values.last )
			@leftnode.values = Range.new(0, 0)
		end
		while( not @inequality.call @leftnode.values.first, @rightnode.values.first )
			@leftnode.values = self.removefront @leftnode.values 
		end

		while( not @inequality.call @leftnode.values.last, @rightnode.values.last )
			@rightnode.values = self.removeback @rightnode.values
		end
	end
end
