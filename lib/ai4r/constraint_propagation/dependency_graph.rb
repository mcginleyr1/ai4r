# Author::    Robert McGinley
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt
require 'edge'
require 'equal_to'
require 'greater_then'
require 'greater_then_equal_to'
require 'less_then'
require 'less_then_equal_to'
require 'node'
require 'not_equal_to'
require 'set'

class DependencyGraph

	attr_accessor :nodes, :edges
	
	def initialize 
		@nodes = Set.new
		@edges = Set.new
	end

	def add_node( name, startvalue, endvalue )
		newnode = Node.new( startvalue, endvalue )
		newnode.name = name 
		@nodes << newnode
	end

	def add_edge_between_nodes( startnodename, endnodename, dependency )
		startnode = self.find_node startnodename
		endnode   = self.find_node endnodename
		edge_type = self.find_edge_type dependency
		@edges << startnode.add_output( endnode, edge_type )	
	end
	
	def find_node( name )	
		the_return_node = nil
		@nodes.each do |anode|
			if( anode.name == name )
				the_return_node = anode
			end
		end
		return the_return_node
	end

	def find_edge( leftname, rightname )
		left_node	  = self.find_node( leftname )
		right_node	  = self.find_node( rightname )		
		the_return_edge = nil
				
		@edges.each do |anedge|
			if( anedge.leftnode = left_node and anedge.rightnode = right_node)
					the_return_edge = anedge
			end
		end
		
		the_return_edge
	end
	
	#Don't want to eval or anything so 
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
	
	def import_nodes( file )
		file = File.open( file )
		lines = file.readlines
		lines.each do |singleline|
			attributes = singleline.split ' ' 
			self.add_node( attributes[0], attributes[1], attributes[2] )
		end
	end
	
	def import_edges( file )
		file = File.open( file )
		lines = file.readlines
		lines.each do | singleline|
			constraint_info = singleline.split ' '
			self.add_edge_between_nodes( constraint_info[0], constraint_info[1], constraint_info[2] )
		end
	end

	def to_s
		temp = ''
		@nodes.each do |a_node|		
			temp = temp + ' | ' + a_node.to_s
		end
		return temp
	end
	
	def random_traverse
		@nodes.each do |a_node|
			yield a_node
		end
	end
	
	def circular? 
		passed_nodes = Array.new
		self.random_traverse do |a_node|
			a_node.outputs.each do |an_edge| 
				if( passed_nodes.include? an_edge.rightnode ) 				
					return true
				else
					passed_nodes << an_edge.rightnode
				end
			end 
		end
		return false;
	end
end
