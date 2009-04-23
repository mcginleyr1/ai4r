class GreaterThen<Edge
	def initialize 
		@inequality = lambda { |a, b| a > b }
	end

	def initialize(lefthand, righthand)
		@leftnode = lefthand
		@rightnode = righthand
		@inequality = lambda { |a, b| a > b }
	end

	def reducedomains
		if( not @inequality.call @leftnode.values.last, @rightnode.values.last )
				@rightnode.values = Range.new( @rightnode.first, @leftnode.values.last - 1 )
		end
		
		if( not @inequality.call @leftnode.values.first, @rightnode.values.first )
			@leftnode.values = Range.new( @rightnode.values.first + 1, @leftnode.values.last )
		end

#		while( not @inequality.call @leftnode.values.last, @rightnode.values.last )
#				@rightnode.values = self.removeback @rightnode
#		end
		
#		while( not @inequality.call @leftnode.values.first, @rightnode.values.first )
#			@leftnode.values = self.removefront @leftnode
#		end
	end
end
