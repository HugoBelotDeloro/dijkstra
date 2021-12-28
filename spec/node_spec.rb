require 'dijkstra'

describe 'Node' do
  it 'should be created' do
    node = Node.new 'my_node'
    expect(node).to_not be_nil
  end
end
