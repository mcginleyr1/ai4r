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
		while( not @lefthand.values.first @inequality @righthand.values.first )
			@righthand.values = self.removefront @righthandvalues
		end

		while( not @lefthand.values.last @inequality @righthand.values.last )
			@lefthand.values = self.removeback @lefthand.values
		end
	end
end
