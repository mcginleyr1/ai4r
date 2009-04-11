class LessThenEqualTo<Edge
	def initialize 
		@inequalifty = '<='
	end
	
	def initalize( lefthand, righthand )
		@lefthandnode = lefthand
		@righthandnode = righthand
		@inequality = '<='
	end

	def reducedomains
		while( not lefthand.max @inequality righthand.max )
			lefthand.end( lefthand.end-- ) 
		end
	end
end
