class Node
  # @param name [String] The name of the node
  # @param default [Hash] The node's default attributes
  # @param attributes [Hash] The node's attributes
  def initialize(name, default = nil, attributes = {})
      @name = name
      @attrs = attributes
  end

  def add_attr(name, value)
      @attrs.add[name] = value
  end

  def add_attrs(attrs)
    @attrs.merge! attrs
  end

  def to_s
    s = String.new
    s << @name.to_s
    unless @attrs.empty?
      arr = @attrs.map do |key, value|
        "%s = %s" % [key, value]
      end
      s << " [%s]" % arr.join(', ')
    end
    s
  end
end
