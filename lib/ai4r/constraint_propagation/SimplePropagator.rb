class SimplePropagator
	attr_accessor :nodes

	def add_node( startvalue, endvalue, name )
		newnode = Node.new( startvalue, endvalue )
		newnode.name = name 
		@nodes << newnode
	end

	def add_edge_between_nodes( startnodename, endnodename, dependency )
		startnode = self.find_node startnodename
		endnode = self.find_node endnodename
		startnode.add_output( endnode, dependency )	
	end

	def find_node( name )
		thereturnnode
		@nodes.each do |anode|
			if( anode.name == name )
				thereturnnode = anode
			end
		end
	end
end
