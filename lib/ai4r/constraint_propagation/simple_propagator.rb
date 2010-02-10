# Author::    Robert McGinley
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt

class SimplePropagator
	attr_accessor :graph
	def initialize( the_graph=nil ) 
		@graph = the_graph
	end
	
	def propagate
		working_stack = []
		@graph.random_traverse do |a_node|
			working_stack.push a_node
		end
		
		while not working_stack.empty? do
			a_node = working_stack.pop
			a_node.outputs.each do |an_edge|
				an_edge.reduce_domains
				if( an_edge.rightnode.values.size = 0 ) do
					an_edge.restore_domains
				else
					working_stack.push an_edge.rightnode
				end
			end
		end		
		return @graph.to_string
	end
	
	
	
end
