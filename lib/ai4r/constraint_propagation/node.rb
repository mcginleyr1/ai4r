# Author::    Robert McGinley
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt


#I HAVE TO CONVERT THIS TO A SET OF RANGES ...............


class Node
	attr_accessor :values, :inputs, :outputs, :name, :startvalue, :endvalue

#	def initialize(startvalue, endvalue)
#		@values = (startvalue..endvalue) 
#	end
	
	def initialize( startvalue, endvalue, name='' )		
		@values 		= (startvalue..endvalue)
		@name 			= name
		@startvalue = startvalue
		@endvalue 	= endvalue
	end

	def add_output(righthandnode, edgetype)
		edgetype.new(self, righthandnode)
	end

	def add_input(lefthandnode, edgetype)
		edgetype.new(lefthandnode, self)
	end
end
