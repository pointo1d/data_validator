# Define/extend global data type classes to provide data validation methods
# specific to/for the DataValidator module

require 'log_wrapper'

class Object
  include LogWrapper

  def validate_value(val)
    debug "#{self}.validate_value(#{val})"

    @re ||= self.get_validator
    ret = DataValidator::ValidationResult.new

    ret.bad!(@re, val) if (val.to_s =~ @re).nil?
    debug "#{self}.validate_value(): #{ret}"
    ret
  end

  def validate_null_value(val)
    debug "#{self}.validate_null_value(#{defn})"

    ret = DataValidator::ValidationResult.new

    ret.bad!(%r{^null$}, val) if
      validate_value(%r{^null$}, defn).is_bad? || !val.nil?
    debug "#{self}.validate_null_value() - #{ret}"
    ret
  end
end

#### END OF FILE
