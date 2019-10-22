# Define/extend global data type classes to provide data validation methods
# specific to/for the DataValidator module

require 'log_wrapper'
require 'data_validator/validation_result'
require 'data_validator/normaliser'
require 'data_validator/classes/array'
require 'data_validator/classes/boolean'
require 'data_validator/classes/date'
require 'data_validator/classes/float'
require 'data_validator/classes/float_or_null'
require 'data_validator/classes/hash'
require 'data_validator/classes/integer'
require 'data_validator/classes/integer_or_null'
require 'data_validator/classes/nil_class'
require 'data_validator/classes/payment'
require 'data_validator/classes/regexp'
require 'data_validator/classes/string'
require 'data_validator/classes/time'
require 'data_validator/classes/string_or_null'

module DDB
  module DataValidator
    module Validator
      extend LogWrapper
      include LogWrapper

      class ValidatorError        < StandardError; end
      class NoConstructorError    < ValidatorError; end

      # Method to perform the data validation using the validator method
      # provided by the data definition under test where the validator is
      # expected to return one of a ...
      # . Regexp  - used to match the stringified form of the data.
      # . Proc    - called with the data value and it's definition -
      #             ValidationResult expected by return .
      # . Symbol  - the name of the method to call with the data and it's
      #             definition, ValidationResult expected by return.
      # . 
      def validate(data, defn)
        info "#{self}.validate(#{data}, #{defn})"

        if defn.respond_to?(:valid?)
          ret = defn.valid?(data)
        elsif defn.respond_to?(:builder?)
          defn.builder.send(:valid?, data)
        else
          ret = data == defn
        end

        info "#{self}.validate(): #{ret}"
        ret
      end
    end
  end
end

#### END OF FILE
