class Node
  def initialize(name, attributes = {})
      @name = name
      @attrs = attributes
  end

  def add_attr(name, value)
      @attrs.add[name] = value
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
