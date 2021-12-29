require 'dijkstra'

describe Attributes do
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

  it 'should overwrite duplicates' do
    @attrs.add :rankdir => 'LR'
    @attrs.add :rankdir => 'TB'
    expect(@attrs.attrs[:rankdir]).to eq 'TB'
  end

  context 'when converting to string' do
    it 'should print "[]" when empty' do
      expect(@attrs.to_s).to eq '[]'
    end

    it 'should print single attributes correctly' do
      @attrs.add rankdir: 'LR'
      expect(@attrs.to_s).to eq '[rankdir="LR"]'
    end

    it 'should print multiple attributes correctly' do
      @attrs.add rankdir: 'LR', class: 'myClass'
      expect(@attrs.to_s).to eq '[rankdir="LR", class="myClass"]'
    end
  end
end
