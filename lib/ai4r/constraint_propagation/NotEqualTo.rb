class NotEqualTo<Edge
	def initialize 
		@inequality = lambda { | a, b | a != b }
	end
	
	def initialize(left, right)
		@leftnode = left
		@rightnode = right
		@inequality = lambda { | a, b | a != b }
	end

	def reducedomains
	#this one is interesting can be any value in domain unless sizes of bothare 1.....
		if( not @inequality.call( @leftnode.values.first, @leftnode.values.last ) and 
		    not @inequality.call( @rightnode.values.first,  @rightnode.values.last ) )
			@rightnode.values = nil 
		end
	end

end
