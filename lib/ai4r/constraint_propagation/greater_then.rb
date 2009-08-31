# Author::    Robert McGinley
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt
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

		if( not @inequality.call @leftnode.values.last, @rightnode.values.last )
			@rightnode.values = Range.new( @rightnode.first, @leftnode.values.last - 1 )
		end
		
		if( not @inequality.call @leftnode.values.first, @rightnode.values.first )
			@leftnode.values = Range.new( @rightnode.values.first + 1, @leftnode.values.last )
		end

	end

	#select_value will be our value selection algorithms for when we are 
	#searching
	def select_value

	end
end
