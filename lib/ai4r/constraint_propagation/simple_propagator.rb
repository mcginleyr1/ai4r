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
	
		return @graph.to_string
	end
	
end
