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
		while(not @inequality.call @leftnode.values.last, @rightnode.values.last)
			@rightnode.values = self.removeback @rightnode.values
		end

		while(not @inequality.call @leftnode.values.first, @rightnode.values.first)
			@leftnode.values = self.removefront @leftnode.values
		end
	end
end
