# Author::    Robert McGinley
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt
class EqualTo<Edge
	def initialize 
		@inequality = lambda { | a, b | a = b }
	end

	def initialize(lefthand, righthand)
		@leftnode = lefthand
		@rightnode = righthand
		@inequality = lambda { | a, b | a = b }
	end

	def reducedomains
		@rightnode.values.each do |rvalues|
			@leftnode.value.each do |lvalues|
				while(not rvalues.include? lvalues.first)
					@leftnode.values.remove lvalues
					@leftnode.values.add self.removefront lvalues.first, lvalues.last
				end
			end
		end
			
		@rightnode.values.each do |rvalues|
			@leftnode.value.each do |lvalues|
				while(not rvalues.include? lvalues.last)
					@leftnode.values.remove lvalues
					@leftnode.values = self.removeback lvalues.first, lvalues.last
				end
#				while(not @rightnode.values.include? @leftnode.values.first)
#					@leftnode.values = self.removefront @leftnode
#				end
#			
#				while(not @rightnode.values.include? @leftnode.values.last)
#					@leftnode.values = self.removeback @leftnode
#				end
			end
		end

		@leftnode.values.each do |lvalues|
			@rightnode.values.each do |rvalues|						
				while(not lvalues.include? rvalues.first)

					@rightnode.values.add self.removefront rvalues.first, rvalues.last
				end
			end
		end

	
		@leftnode.values.each do |lvalues|
			@rightnode.values.each do |rvalues|						
				while(not lvalues.include? rvalues.last)
					@rightnode.values.add self.removeback rvalues.first, rvalues.last
				end
#				while(not @leftnode.values.include? @rightnode.values.first)
#					@rightnode.values = self.removefront @rightnode
#				end
#	
#				while(not @leftnode.values.include? @rightnode.values.last)
#					@righttnode.values = self.removeback @rightnode
#				end
			end
		end
	end
end
