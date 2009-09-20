# Author::    Robert McGinley
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt
class StackPropagate

	def begin_propagation
		@edgestoreduce.each do |anedge|
			anedge.reducedomains
			if not anedge.rightnode.outputs.nil? 
				anedge.rightnode.outputs.each do |aoedge|
					@edgestoreduce << aoedge
				end
			end
		end
	end

end
