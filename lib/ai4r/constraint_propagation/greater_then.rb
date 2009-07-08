# Author::    Robert McGinley
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt
class GreaterThen<Edge
	def initialize 
		@inequality = lambda { |a, b| a > b }
	end

	def initialize(lefthand, righthand)
		@leftnode = lefthand
		@rightnode = righthand
		@inequality = lambda { |a, b| a > b }
	end

	def reducedomains
		@rightnode.values.each do |rvalues|
			@leftnode.value.each do |lvalues|
				if( not @inequality.call @leftnode.values.last, @rightnode.values.last )
					@rightnode.values.remove rvalues
					@rightnode.values.add Range.new( rvalues.first, lvalues.last - 1 )
				end
			end
		end
		@rightnode.values.each do |rvalues|
			@leftnode.value.each do |lvalues|
				if( not @inequality.call lvalues.first, rvalues.first )
					@lefnode.values.remove lvalues
					@leftnode.values.add Range.new( rvalues.first + 1, lvalues.last )
				end
			end
		end

#		if( not @inequality.call @leftnode.values.last, @rightnode.values.last )
#			@rightnode.values = Range.new( @rightnode.first, @leftnode.values.last - 1 )
#		end
#		
#		if( not @inequality.call @leftnode.values.first, @rightnode.values.first )
#			@leftnode.values = Range.new( @rightnode.values.first + 1, @leftnode.values.last )
#		end

#		while( not @inequality.call @leftnode.values.last, @rightnode.values.last )
#				@rightnode.values = self.removeback @rightnode
#		end
		
#		while( not @inequality.call @leftnode.values.first, @rightnode.values.first )
#			@leftnode.values = self.removefront @leftnode
#		end
	end
end
