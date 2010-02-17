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
	    self.init_common_variables
		@inequality = lambda { | a, b | a >= b }
	end
	
	def initialize(lefthand, righthand)
		self.init_common_variables
		@leftnode   = lefthand
		@rightnode  = righthand
		@inequality = lambda { | a, b | a >= b }
	end

	def reduce_domains
		self.store_original_domains		
		
		lvalues 		= @leftnode.values
		rvalues 		= @rightnode.values

		if( not @inequality.call lvalues.first, rvalues.first )		
			@leftnode.values = Range.new( rvalues.first, lvalues.last )
		end

		
		if( not @inequality.call lvalues.last, rvalues.last )
			@rightnode.values = Range.new( rvalues.first, lvalues.last )
		end
	end
	#searching
	#def select_value

	#end
end
