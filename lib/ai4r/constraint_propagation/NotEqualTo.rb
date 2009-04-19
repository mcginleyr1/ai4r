class NotEqualTo<Edge
	def initialize 
		@inequalifty = '!='
	end
	
	def initalize( left, right )
		@leftnode = left
		@rightnode = right
		@inequality = '!='
	end

	def reducedomains
	#this one is interesting can be any value in domain unless sizes of bothare 1.....
		if( ( @leftnode.value.first = @leftnode.value.last ) and ( @rightnode.value.first = @rightnode.value.last ) )
			@rightnode.values = nil 
		end
	end

end
