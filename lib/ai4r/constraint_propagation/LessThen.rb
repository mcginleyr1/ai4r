class LessThen<Edge
	def initialize 
		@inequalifty = '<'
	end
	
	def initalize( lefthand, righthand )
		@lefthandnode = lefthand
		@righthandnode = righthand
		@inequality = '<'
	end

	def reducedomains
		if( not @lefthand.values.first @inequality @righthand.values.last)
			@lefthand.values = Range.new( 0,0 )
		end

		while( not @lefthand.values.first @inequality @righthand.values.first )
			@righthand.values = self.removefront @righthand.values
		end

		while( not @lefthand.values.last @inequality @righthand.values.last )
			@lefthand.valeus = self.removeback @lefthand.values
		end
	end
end
