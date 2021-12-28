require 'dijkstra'

describe Graph do
  it 'should be created' do
    g = Graph.new 'my_test_graph'
    expect(g).to_not be_nil
  end

  it 'should contain no node' do
    g = Graph.new 'my_test_graph'
    expect(g.nodes).to eql({})
  end

  context '.node() ' do
    it 'should create a new node' do
      g = Graph.new 'my_test_graph'
      node = g.node 'my_node'
      expect(g.nodes).to eql({'my_node' => node})
    end
  end

end
