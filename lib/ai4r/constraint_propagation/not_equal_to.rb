# Author::    Robert McGinley
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt
class NotEqualTo<Edge
	def initialize 
		@inequality = lambda { | a, b | a != b }
	end
	
	def initialize(left, right)
		@leftnode = left
		@rightnode = right
		@inequality = lambda { | a, b | a != b }
	end

	def reducedomains
		self.store_original_domains
	end


	#select_value will be our value selection algorithms for when we are 
	#searching
	def select_value

	end

end
