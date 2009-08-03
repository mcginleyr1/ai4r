# Author::    Robert McGinley
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt
class GreaterThenEqualTo<Edge
	def initialize 
		@inequality = lambda { | a, b | a >= b }
	end
	
	def initialize(lefthand, righthand)
		@leftnode = lefthand
		@rightnode = righthand
		@inequality = lambda { | a, b | a >= b }
	end

	def reducedomains
=begin
		@leftnode.value.each do |lvalues|
			@rightnode.values.each do |rvalues|
				if( not @inequality.call lvalues.last, rvalues.first )
					@rightnode.values.remove rvalues
				end
			end
		end
=end		
		@leftnode.value.each do |lvalues|
			@rightnode.values.each do |rvalues|
				if( not @inequality.call lvalues.first, rvalues.first )
					@leftnode.value.remove lvalues
					@leftnode.values = Range.new( rvalues.first, lvalues.last )
				end
			end
		end

	
		@leftnode.value.each do |lvalues|
			@rightnode.values.each do |rvalues|
				if( not @inequality.call lvalues.last, rvalues.last )
					@rightnode.values.remove rvalues
					@rightnode.values = Range.new( rvalues.first, lvalues.last )
				end
			end
		end

#		while( not @inequality.call @leftnode.values.first, @rightnode.values.first )
#			@leftnode.values = self.removefront @leftnode
#		end
	
#		while( not @inequality.call @leftnode.values.last, @rightnode.values.last )
#			@rightnode.values = self.removeback @rightnode 
#		end
	end
end
