# Author::    Robert McGinley
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt
class GreaterThenEqualTo<Edge
	def initialize 
		@inequality = lambda { | a, b | a >= b }
	end
	
	def initialize(lefthand, righthand)
		@leftnode = lefthand
		@rightnode = righthand
		@inequality = lambda { | a, b | a >= b }
	end

	def reducedomains
		if( not @inequality.call @leftnode.values.last, @rightnode.values.first )
			@rightnode.values = nil 
		end
		
		if( not @inequality.call @leftnode.values.first, @rightnode.values.first )
			@leftnode.values = Range.new( @rightnode.values.first, @leftnode.values.last )
		end
	
		if( not @inequality.call @leftnode.values.last, @rightnode.values.last )
			@rightnode.values = Range.new( @rightnode.values.first, @leftnode.values.last )
		end
#		while( not @inequality.call @leftnode.values.first, @rightnode.values.first )
#			@leftnode.values = self.removefront @leftnode
#		end
	
#		while( not @inequality.call @leftnode.values.last, @rightnode.values.last )
#			@rightnode.values = self.removeback @rightnode 
#		end
	end
end
