# Author::    Robert McGinley
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt
class StackPropagator
	require 'Edge.rb'
	require 'EqualTo.rb'
	require 'GreaterThen.rb'
	require 'GreaterThenEqualTo.rb'
	require 'LessThen.rb'
	require 'Node.rb'
	require 'NotEqualTo.rb'
	require 'set'

	attr_accessor :nodes, :edgestoreduce

	def initialize
		@nodes = Set.new
		@edgestoreduce = Set.new
	end

	def add_node( name, startvalue, endvalue )
		newnode = Node.new(name, startvalue, endvalue )
		@nodes << newnode
	end

	def add_edge_between_nodes( startnodename, endnodename, dependency )
		startnode = self.find_node startnodename
		endnode = self.find_node endnodename
		thedependency = self.find_edge_type dependency
		@edgestoreduce << startnode.add_output( endnode, thedependency )	
	end

	def find_node( name )
		thereturnnode
		@nodes.each do |anode|
			if( anode.name == name )
				thereturnnode = anode
			end
		end
		thereturnnode
	end

	def begin_propagation
		edgestoreduce.each do |anedge|
			anedge.reducedomains
			anedge.rightnode.outputs.each do |aoedge|
				edgestoreduce << aoedge
			end
		end
	end

	def find_edge_type( name )
		if name == 'LessThenEqualTo'
			return LessThenEqualTo
		elsif name == 'LessThen'
			return LessThen
		elsif name == 'GreaterThenEqualTo'
			return GreaterThenEqualTo
		elsif name == 'GreaterThen'
			return GreaterThen
		elsif name == 'EqualTo'
			return EqualTo
		elsif name == 'NotEqualTo'
			return NotEqualTo
		end
	end

end
