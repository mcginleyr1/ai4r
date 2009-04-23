require 'Node.rb'
require 'Edge.rb'
require 'EqualTo.rb'
require 'GreaterThen.rb'
require 'GreaterThenEqualTo.rb'
require 'LessThen.rb'
require 'LessThenEqualTo.rb'
require 'NotEqualTo.rb'

node1 = Node.new(5,8)
node3 = Node.new(1,10)
node4 = Node.new(4,11)

edge1 = node3.add_output(node1, GreaterThenEqualTo )
#edge4 = node4.add_output(node1, LessThen)

edge1.reducedomains
#edge4.reducedomains

p node1.values.to_s
p node3.values.to_s
p node4.values.to_s

