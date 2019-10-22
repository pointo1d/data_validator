# Define/extend global data type classes to provide data validation methods
# specific to/for the DataValidator module

require 'log_wrapper'
require 'data_validator/validation_result'
require 'data_validator/classes/base'

class FloatOrNull
  include LogWrapper
  extend DataValidator::Base

  def self.builder
    info "#{self}.new()"
    ret = allocate
    info "#{self}.new(): #{ret}"
    ret
  end

  def is_valid_class?(data, defn)
    info "#{self}.is_valid_class?(#{data}, #{defn})"
    info "#{self}.is_valid_class?() - #{data.class}, #{defn.class}"

    ret = Float.builder(1).send(:is_valid_class?, data, defn) || (
      (is_in?(FloatOrNull, data) || is_in?(String, data)) &&
      (is_in?(FloatOrNull, defn) || is_in?(String, defn))
    )
      
    info "#{self}.is_valid_class?(): #{ret}"
    ret
  end

  def valid_value?(data)
    info "#{self}.valid_value?(#{data}) - #{data.class}"

    ret = data.nil? ||
      Float.valid?(data).is_good? ||
      !(data.to_s =~ %r{^(FloatOrNull|null)$}).nil?

    info "#{self}.valid_value?(): #{ret}"
    ret
  end

  def valid?(data)
    info "#{self}.valid?(#{data})"

    ret = DataValidator::ValidationResult.new
    ret.bad!(self, data) unless valid_value?(data)

    info "#{self}.valid?(): #{ret}"
    ret
  end
end

#### END OF FILE
