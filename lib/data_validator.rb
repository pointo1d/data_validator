# Load the global data type class extensions - extended to provide data
# validation methods specific to/for use in/by the DataValidator module
# Standard Gems

# Bespoke Gems & libraries
# Load our logger wwrapper ...
require 'log_wrapper'
require 'data_validator/validation_result'
require 'data_validator/validator'

module DDB
  module DataValidator
    extend LogWrapper
    include LogWrapper
    include Validator

    # Tweak the log level
    get_logger.level = ENV['DATA_VALIDATOR_LOG_LEVEL'] if
      ENV['DATA_VALIDATOR_LOG_LEVEL']

    # Module specific exceptions
    class DataValidatorError              < StandardError; end
    class NilExpectedClassError           < DataValidatorError; end

    #
    # Description:
    #   Method to validate the given data structure against the given structure
    #   definition. Note that this relies on the fundamental Ruby data classes
    #   being extended to provide valid?() methods - each of which returns a
    #   hash that contains nothing i.e. is empty, iff the data complies with
    #   its' definition; Otherwise one, or more, of the following keys will be
    #   present dependent on the stated condition ...
    #     * bad - the given value(s) fail the given validation check(s)
    #     * mis - the given elements are present in the defintion, but missing
    #             from the data
    #     * add - the given elements are missing from in the defintion, but
    #             present in the data
    #
    #   Validation s/b acheived by calling valid?() on the definition and
    #   given the data - this s/b followed thro' in all of the class extensions.
    #
    #   The definition conforms to the following...
    #     * A simple class name identifies the 'type' of the data
    #     * An instance of a simple class defines a constant value
    #     * A complex class name is not allowed
    #     * An instance of a complex class (Array or Hash) identifies the
    #       structure to which the data must conform.
    #
    # Synopsis:
    #   validate_data(data, definition)
    #
    def validate_data(data, defn)
      info "validate_data(#{data}, #{defn})"

      #ret = ValidationResult.new

      # Early parm validation
      if data.nil? && defn.nil?
        # Catch the simplest - instead of the special case, should really extend
        # the NilClass in the same way as the others
      elsif defn.nil?
        raise NilExpectedClassError
      else
        ret = validate(data, defn)
      end

      info "validate_data(): #{ret}"
      ret
    end
  end
end

#### END OF FILE
