module IdentityMind
  class Params < OpenStruct
    def self.[](hash)
      return hash if hash.is_a?(self)

      new(hash)
    end

    def initialize(hash = nil)
      @table = {}
      return unless hash

      hash.each_pair do |k, v|
        @table[k.to_sym] = parse_param(v)
      end
    end

    def []=(name, value)
      super(name, parse_param(value))
    end

    def to_json(opts = {})
      @table.to_json(opts)
    end

    def method_missing(mid, *args)
      args[0] = parse_param(args[0]) if args[0]
      super
    end

    def respond_to_missing?(method_name, include_private = false)
      super
    end

    private

    def new_ostruct_member!(name)
      name = name.to_sym
      unless singleton_class.method_defined?(name)
        define_singleton_method(name) { @table[name] }
        define_singleton_method("#{name}=") do |x|
          modifiable?[name] = parse_param(x)
        end
      end
      name
    end

    def parse_param(value)
      value = value.to_s if value.is_a?(Symbol)
      return value unless value.is_a?(String)

      result = value[0, IdentityMind.configuration.param_length_limit]

      while result.bytesize > IdentityMind.configuration.param_length_limit
        result = result[0...-1]
      end

      result
    end
  end
end
