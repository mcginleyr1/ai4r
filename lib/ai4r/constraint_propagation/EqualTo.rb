class EqualTo<Edge
	def initialize 
		@inequalifty = '='
	end

	def initalize( lefthand, righthand )
		@leftnode = lefthand
		@rightnode = righthand
		@inequality = '='
	end

	def reducedomains
		while( not @rightnode.values.include @leftnode.values.first )
			@leftnode.value = self.removefront @leftnode.value 
		end
		
		while( not @rightnode.values.include @leftnode.values.first )
			@leftnode.value = self.removefront @leftnode.value 
		end

		while( not @rightnode.values.include @leftnode.values.first )
			@leftnode.value = self.removefront @leftnode.value 
		end
		
		while( not @rightnode.values.include @leftnode.values.first )
			@leftnode.value = self.removefront @leftnode.value 
		end

				
	end
end
