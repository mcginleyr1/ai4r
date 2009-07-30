# Author::    Robert McGinley
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt
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
			@leftnode.values = self.removefront @leftnode
 		end
		
		while(not @rightnode.values.include? @leftnode.values.last)
			@leftnode.values = self.removeback @leftnode
		end

	
#				while(not @leftnode.values.include? @rightnode.values.first)
#					@rightnode.values = self.removefront @rightnode
#				end
#	
#				while(not @leftnode.values.include? @rightnode.values.last)
#					@righttnode.values = self.removeback @rightnode
#				end
	end
end
