# Author::    Robert McGinley
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt

class Node
	attr_accessor :values, :inputs, :outputs, :name, :startvalue, :endvalue
	
	def initialize( startvalue, endvalue, name='' )		
		@values 		= (startvalue..endvalue)
		@name 			= name
		@startvalue 	= startvalue
		@endvalue 		= endvalue
		@inputs			= Set.new
		@outputs		= Set.new
	end

	def add_output(righthandnode, edgetype)
		an_edge = edgetype.new(self, righthandnode)
		@outputs << an_edge
	end

	def add_input(lefthandnode, edgetype)
		an_edge = edgetype.new(lefthandnode, self)
		@inputs << an_edge
	end
	
	def to_s
		return @startvalue.to_s + '...' + @endvalue.to_s
	end
end
