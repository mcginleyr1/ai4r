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
		class Node
			attr_accessor :possiblevalues, :edges

			def initialize( startvalue, endvalue )
				:possiblevalues << (starvalue..endvalue)
			end
		end

		class LessThen
			attr_accessor :inequality
			def initialize 
				@inequalifty = '<'
			end
		end

		class LessThenEqualTo
			attr_accessor :inequality
			def initialize 
				@inequalifty = '<='
			end
		end

		class GreaterThen
			attr_accessor :inequality
			def initialize 
				@inequalifty = '>'
			end
		end

		class GreaterThenEqualTo
			attr_accessor :inequality
			def initialize 
				@inequalifty = '>='
			end
		end

		class EqualTo
			attr_accessor :inequality
			def initialize 
				@inequalifty = '='
			end
		end

		class NotEqualTo
			attr_accessor :inequality
			def initialize 
				@inequalifty = '!='
			end
		end
	end
end
