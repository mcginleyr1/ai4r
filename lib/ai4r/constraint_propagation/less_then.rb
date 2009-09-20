# Author::    Robert McGinley
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt
class LessThen<Edge
	def initialize 
		self.init_common_variables
		@inequalifty = lambda { | a, b | a < b }
	end
	
	def initialize(leftnode, rightnode)
		self.init_common_variables
		@leftnode   = leftnode
		@rightnode  = rightnode
		@inequality = lambda { | a, b | a < b }
	end

	def reducedomains
		self.store_original_domains
	
		if( not @inequality.call @leftnode.values.first, @rightnode.values.last ) 
			@leftnode.values = Range.new(0,0)
		end

		if( not @inequality.call @leftnode.values.first, @rightnode.values.first ) 
			@rightnode.values = Range.new( @leftnode.values.first + 1, @rightnode.values.last )
		end

		if( not @inequality.call @leftnode.values.last, @rightnode.values.last ) 
			@leftnode.values = Range.new( @leftnode.values.first, @rightnode.values.last - 1 )
		end
	end

	#select_value will be our value selection algorithms for when we are 
	#searching
	def select_value

	end
end
