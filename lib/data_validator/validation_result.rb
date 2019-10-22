# Load the global data type class extensions - extended to provide data
# validation methods specific to/for use in/by the DataValidator module
# Standard Gems

# Bespoke Gems & libraries
# Load our logger wwrapper ...
require 'log_wrapper'

module DDB
  module DataValidator
    class ValidationResult
    
      include LogWrapper

      def initialize
        info "#{self}.new()"
        @bad, @extra, @missing = {}, {}, {}
        @@logger ||= get_logger()
      end

      def bad!(data, defn)
        info "#{self}.bad!(#{data}, #{defn})"
        @bad[data] = defn
        info "#{self}.bad!(): #{self}"
        self
      end

      def extra!(data, defn)
        info "#{self}.extra!(#{data}, #{defn})"
        @extra[data] = defn
        info "#{self}.extra!(): #{self}"
        self
      end

      def missing!(data, defn)
        info "#{self}.missing!(#{data}, #{defn})"
        @missing[data] = defn
        info "#{self}.missing!(): #{self}"
        self
      end

      def is_good?
        info "#{self}.failed?()"
        ret = [:bad, :extra, :missing].select do |m|
          !instance_variable_get("@#{m}").empty?
        end.empty?

        info "#{self}.is_valid?(): #{ret}"
        ret
      end

      def is_bad?
        info "#{self}.is_bad?()"
        ret = !is_good?

        info "#{self}.is_bad?(): #{ret}"
        ret
      end

      def merge!(src)
        info "#{self}.merge!(#{src})"
        src = src.normalize if src.is_a?(self.class)
        info "#{self}.merge!() - #{src} - #{@bad}, #{@extra}, #{@missing}"
        src.each do |k, v|
          debug "#{self}.merge!() - k: #{k}, v: #{v}"
          var = instance_variable_get("@#{k}")
          debug "#{self}.merge!() - #{k} -> #{var}"
          instance_variable_set("@#{k}", var.merge!(v))
        end
        info "#{self}.merge!(): #{@bad}, #{@extra}, #{@missing}"
        info "#{self}.merge!(): #{self}"
        self
      end

      def normalize
        info "#{self}.normalize()"
        ret = [:bad, :extra, :missing].inject({}) do |h, e|
          debug "#{self}.normalize() - #{h}, #{e}"
          val = instance_variable_get("@#{e}")
          h[e] = val unless val.empty?
          h
        end
        info "#{self}.normalize(): #{ret}"
        ret
      end
    end
  end
end

#### END OF FILE
