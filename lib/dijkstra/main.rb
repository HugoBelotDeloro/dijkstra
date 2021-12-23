require_relative 'graph'

penwidth = 3.0

white = '"#f7f7f7"'
light_gray = '"#cacaca"'
dark_gray = '"#636363"'
background = '"#2c2c2c"'
black = '"#1c1c1c"'

border_color = black

g = Graph.new 'my_test_graph'

g.set_default_node_attrs shape: 'circle', style: 'filled', penwidth: penwidth, color: border_color

g.new_node :a, fillcolor: '"#bc5653"'
g.new_node :b, fillcolor: '"#909d63"'
g.new_node :c, fillcolor: '"#7eaac7"'


g.new_edge :a, :b
g.new_edge :b, :c

g.set_graph_attr rankdir: 'LR', outputorder: 'edgesfirst', bgcolor: background
g.set_default_edge_attrs penwidth: penwidth, color: border_color

puts g
