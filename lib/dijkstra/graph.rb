require 'set'
require_relative 'printer'
require_relative 'node'

class Graph

  # @param name [String] The name of the graph
  def initialize(name)
    @name = name
    @nodes = {} # name => Node
    @edges = {} # { src => { dst => count } }
    @node_default_attrs = {}
    @graph_attrs = {}
    @edge_default_attrs = {}
  end

  # Adds a new edge between the source and destination, possibly creating the nodes if missing.
  # @param src [String, Symbol] the name of the edge
  def new_edge(src, dst)
    node(src)
    node(dst)
    @edges[src] = {} unless @edges.include? src
    entry = @edges[src]
    if entry[dst] == nil
      entry[dst] = 1
    else
      entry[dst] += 1
    end
  end

  def nodes
    @nodes
  end

  # Adds a node of given name and attributes
  # If a node of the same name already exists simply  apply attributes onto it.
  #
  # @param name [String, Symbol] The name of the node
  # @param attrs [Hash] The node's attributes.
  def node(name, attrs = {})
    attrs = @node_default_attrs.merge attrs
    @nodes[name] = Node.new name, attrs unless @nodes.include? name
  end

  def set_default_node_attrs(attrs)
    @node_default_attrs.merge! attrs
  end

  def set_default_edge_attrs(attrs)
    @edge_default_attrs.merge! attrs
  end

  def set_graph_attr(attrs)
    @graph_attrs.merge! attrs
  end

  def each_node
    if block_given?
      @nodes.each { |node| yield node }
    else
      @nodes.each
    end
  end

  def to_s
    s = Printer.new
    s << "digraph %s {" % @name
    s.inc_indent

    @graph_attrs.each do |name, value|
      s << '%s = %s;' % [name, value]
    end

    attrs = @edge_default_attrs.map do |key, value|
      '%s = %s' % [key, value]
    end.join(', ')
    s << 'edge [%s]' % attrs unless attrs.empty?

    @nodes.each do |_, node|
      s << node.to_s + ';'
    end
    s << ''

    @edges.each do |src, dest_nodes|
      dest_nodes.each do |dst, count|
        count.times do
          s << "%s -> %s;" % [src, dst]
        end
      end
    end
    s.dec_indent
    s << "}"
    s
  end
end
