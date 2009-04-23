class EqualTo<Edge
	def initialize 
		@inequality = lambda { | a, b | a = b }
	end

	def initialize(lefthand, righthand)
		@leftnode = lefthand
		@rightnode = righthand
		@inequality = lambda { | a, b | a = b }
	end

	def reducedomains
		while(not @rightnode.values.include? @leftnode.values.first)
			@leftnode.values = self.removefront @leftnode.values 
		end
		
		while(not @rightnode.values.include? @leftnode.values.last)
			@leftnode.values = self.removeback @leftnode.values 
		end

		while(not @leftnode.values.include? @rightnode.values.first)
			@rightnode.values = self.removefront @rightnode.values 
		end
		
		while(not @leftnode.values.include? @rightnode.values.last)
			@righttnode.values = self.removeback @rightnode.values 
		end
	end
end
