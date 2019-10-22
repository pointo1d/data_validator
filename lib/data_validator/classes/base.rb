# Define/extend global data type classes to provide data validation methods
# specific to/for the DataValidator module

require 'log_wrapper'

module DDB
  module DataValidator
    module Base
      extend LogWrapper
      include LogWrapper

      class ValidatorError                  < StandardError; end
      class NoBuilderError                  < ValidatorError; end

      def self.extended(mod)
        info "#{self}.extended(#{mod})"

        # Define the valid?() method on/in/for the consumer/requirer
        mod.define_singleton_method(:valid?) do |data|
          info "#{self}.valid?(#{data}) - #{data.class}"

          raise(NoBuilderError, self) unless self.respond_to?(:builder)
          inst = self.builder
          debug "#{self}.valid?() - inst: #{inst} (#{inst.class})"
          ret = inst.valid?(data)

          info "#{self}.valid?(): #{ret}"
          ret
        end

        info "#{self}.extended()::"
      end
    end
  end
end

#### END OF FILE
