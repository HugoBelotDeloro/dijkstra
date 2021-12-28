class Attributes

  # @param type [:graph, :cluster, :edge, :node] The type of attributes that should be accepted.
  def initialize(type)
    @type = type
    @attrs = {}
  end

  attr_reader :attrs, :type

  # Adds a number of attributes.
  # @param attrs [Hash{Symbol => String}]
  # @raise [RuntimeError] if the attribute does not exist or is not valid for this attribute list's type.
  def add(attrs)
    attrs.each do |name, value|
      raise "Unknown attribute #{name}" if ATTRIBUTES[name] === nil
      raise "Invalid attribute #{name} for #{@type}" unless is_valid_target_for? name
      @attrs[name] = value
    end
  end

  # Is this attribute name valid for self ?
  # @param attr_name [Symbol] The attribute's name.
  def is_valid_target_for? attr_name
    ATTRIBUTES[attr_name][1].has_key? @type
  end
end

# Is this attribute valid ?
# @param attr_name [Symbol] The attribute name to test.
def attribute_exists?(attr_name)
  ATTRIBUTES.has_key? attr_name
end

# A hash matching each attribute name to an array containing its type, default value and valid targets.
# @type [{Symbol => (<Symbol>, {:graph, :cluster, :node, :edge => String})}] ATTRIBUTES
ATTRIBUTES = {
  :color => [[:color, :colorList], {cluster: 'black', edge: 'black', node: 'black'}],
  :fillcolor => [[:color, :colorList], {cluster: 'black', edge: 'black', node: 'lightgrey'}],
  :rankdir => [[:rankdir], {graph: 'TB'}],
}
