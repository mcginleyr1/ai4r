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
		if( not @inequality.call( @leftnode.value.first, @leftnode.value.last ) and 
		    not @inequality.call( @rightnode.value.first,  @rightnode.value.last ) )
			@rightnode.values = nil 
		end
	end

end
