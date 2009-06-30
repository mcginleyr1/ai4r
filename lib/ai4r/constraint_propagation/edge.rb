# Author::    Robert McGinley
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt
class Edge
	attr_accessor :inequality, :leftnode, :rightnode

	def initialize(lefthand, righthand)
		@leftnode = lefthand
		@rightnode = righthand
		@leftnode.outputs.add self
		@rightnode.inputs.add self
	end

	def reducedomains
	end

	def removefront(anode)
		Range.new( anode.values.first + 1, anode.values.last)
	end

	def removeback(anode)
		Range.new( anode.values.first, anode.values.last - 1)
	end
end
