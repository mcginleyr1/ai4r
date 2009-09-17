# Author::    Robert McGinley
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt
class Edge
	attr_accessor :inequality, :leftnode, 
				  :rightnode,  :leftdomain, 
				  :rightdomain							  

	def initialize(lefthand, righthand)
		@leftnode = lefthand
		@rightnode = righthand
		@leftnode.outputs.add self
		@rightnode.inputs.add self
	end

	def reducedomains
	end

	#select_value will be our value selection algorithms for when we are 
	#searching
	def select_value
	end
	
	def store_original_domains
		@leftdomain  = @leftnode.values
		@rightdomain = @rightnode.values
	end		
	
	
	def restore_domains
		@leftnode.values  = @firstleft..@lastleft
		@rightnode.values = @firstright..@lastleft
	end	

	def removefront(first, last)
		Range.new( first + 1, last)
	end

	def removeback(first, last)
		Range.new( first, last - 1)
	end
end
