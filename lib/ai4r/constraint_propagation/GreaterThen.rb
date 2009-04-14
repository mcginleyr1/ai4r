class GreaterThen<Edge
	def initialize 
		@inequality = '>'
	end

	def initalize( lefthand, righthand )
		@leftnode = lefthand
		@rightnode = righthand
		@inequality = '>'
	end

	def reducdedomains
		while( not @leftnode.values.last @inequality @rightnode.values.last )
			@rightnode.values = self.removeback @rightnode.values
		end

		while( not @leftnode.values.first @inequality @rightnode.values.first )
			@leftnode.values = self.removefront @leftnode.values
		end
	end
end
