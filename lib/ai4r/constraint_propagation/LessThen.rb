class LessThen<Edge
	def initialize 
		@inequalifty = lambda { | a, b | a < b }
	end
	
	def initialize(leftnode, rightnode)
		@leftnode = leftnode
		@rightnode = rightnode
		@inequality = lambda { | a, b | a < b }
	end

	def reducedomains
		if( not @inequality.call @leftnode.values.first, @rightnode.values.last ) 
			@leftnode.values = Range.new(0,0)
		end

		while( not @inequality.call @leftnode.values.first, @rightnode.values.first ) 
			@rightnode.values = self.removefront @rightnode.values
		end

		while( not @inequality.call @leftnode.values.last, @rightnode.values.last ) 
			@leftnode.values = self.removeback @leftnode.values
		end
	end
end
