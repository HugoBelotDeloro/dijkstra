require 'dijkstra'

describe 'Attributes' do
  before :each do
    @attrs = Attributes.new :graph
  end

  it 'should be created' do
    expect(@attrs).to_not be_nil
  end

  it 'should be empty when created' do
    expect(@attrs.attrs).to eq({})
  end

  it 'should raise on unknown attribute name' do
    expect do
      @attrs.add :unknown_name => 'some_value'
    end.to raise_error 'Unknown attribute unknown_name'
  end

  it 'should raise on invalid attribute target' do
    expect do
      @attrs.add :color => 'blue'
    end.to raise_error 'Invalid attribute color for graph'
  end

  it 'should correctly add valid attributes' do
    @attrs.add :rankdir => 'LR'
    expect(@attrs.attrs[:rankdir]).to eq 'LR'
  end
end
