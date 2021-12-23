class Printer < String
    def initialize(indent_size = 2)
        @indent_size = indent_size
        @indent_level = 0
    end

    def current_indent
        ' ' * @indent_level * @indent_size
    end

    def <<(str)
        super current_indent + str + "\n"
    end

    def inc_indent
        @indent_level += 1
    end

    def dec_indent
        @indent_level -= 1
    end
end
