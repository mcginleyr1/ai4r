require 'dependency_graph'

graph = DependencyGraph.new

graph.add_node( 5, 8, 'node1' )
graph.add_node( 7, 10, 'node2' )
graph.add_node( 4, 11, 'node3' )
graph.add_node( 1, 20, 'node4' )
graph.add_node( 1, 20, 'node5' )
graph.add_node( 1, 20, 'node6' )
graph.add_node( 1, 40, 'node7' )



graph.add_edge_between_nodes( node3, node1, GreaterThenEqualTo )
graph.add_edge_between_nodes( node2, node1, LessThen )
graph.add_edge_between_nodes( node4, node3, GreaterThen )
graph.add_edge_between_nodes( node5, node1, EqualTo )
graph.add_edge_between_nodes( node6, node2, LessThen )
graph.add_edge_between_nodes( node7, node1, GreaterThen )
		


p '::::POST REDUCTION::::'
p 'node1: ' + node1.values.to_s
p 'node2: ' + node2.values.to_s
p 'node3: ' + node3.values.to_s
p 'node4: ' + node4.values.to_s
p 'node5: ' + node5.values.to_s
p 'node6: ' + node6.values.to_s
p 'node7: ' + node7.values.to_s
