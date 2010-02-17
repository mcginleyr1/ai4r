# Author::    Robert McGinley
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt
module Ai4r
	module ConstraintPropagation
		require 'dependency_graph'
		require 'simple_propagator'
		
		class Propagation_Engine
			attr_accessor :graph, :propagator
			
			def initialize( type )
				@graph 		= DependencyGraph.new
				@propagator = type.new @graph
			end
			
			def load_graph( node_file, edge_file )
				@graph.import_nodes node_file
				@graph.import_edges edge_file
			end
			
			def run_propagation
				raise "Graph contains circularity." if @graph.circular?
				return @propagator.propagate 
			end
		end
		
	end
end
