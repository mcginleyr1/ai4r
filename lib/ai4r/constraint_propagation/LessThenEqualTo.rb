class LessThenEqualTo<Edge
	def initialize 
		@inequality = lambda { | a, b | a <= b }
	end
	
	def initialize(lefthand, righthand)
		@lefthandnode = lefthand
		@righthandnode = righthand
		@inequality = lambda { | a, b | a <= b }
	end

	def reducedomains
		while(not @inequality.call @lefthand.values.first, @righthand.values.first)
			@righthand.values = self.removefront @righthandvalues
		end

		while(not @inequality.call @lefthand.values.last, @righthand.values.last)
			@lefthand.values = self.removeback @lefthand.values
		end
	end
end
