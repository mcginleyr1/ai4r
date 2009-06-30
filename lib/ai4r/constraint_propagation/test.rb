require 'edge'
require 'equal_to'
require 'greater_then'
require 'greater_then_equal_to'
require 'less_then'
require 'less_then_equal_to'
require 'node'
require 'not_equal_to'
require 'set'

node1 = Node.new(5,8)
node2 = Node.new(7,10)
node3 = Node.new(4,11)
node4 = Node.new(1,20)
node5 = Node.new(1,20)
node6 = Node.new(1,20)
node7 = Node.new(1,40)

p '::::PRE REDUCTION::::'
p 'node1: ' + node1.values.to_s
p 'node2: ' + node2.values.to_s
p 'node3: ' + node3.values.to_s
p 'node4: ' + node4.values.to_s
p 'node5: ' + node5.values.to_s
p 'node6: ' + node6.values.to_s
p 'node7: ' + node7.values.to_s

edge1 = node3.add_output(node1, GreaterThenEqualTo )
edge2 = node2.add_output(node1, LessThen )
edge3 = node4.add_output(node3, GreaterThen )
edge4 = node5.add_output(node4, LessThenEqualTo )
edge5 = node6.add_output(node1, EqualTo )
edge6 = node7.add_output(node2, NotEqualTo )

		

edge1.reducedomains
edge2.reducedomains
edge3.reducedomains
edge4.reducedomains
edge5.reducedomains
edge6.reducedomains

p '::::POST REDUCTION::::'
p 'node1: ' + node1.values.to_s
p 'node2: ' + node2.values.to_s
p 'node3: ' + node3.values.to_s
p 'node4: ' + node4.values.to_s
p 'node5: ' + node5.values.to_s
p 'node6: ' + node6.values.to_s
p 'node7: ' + node7.values.to_s
