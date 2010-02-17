require 'constraint_propagation'
include Ai4r::ConstraintPropagation

@engine = Propagation_Engine.new( SimplePropagator )
@engine.load_graph 'nodes_example.txt', 'edges_example.txt'
p @engine.run_propagation
