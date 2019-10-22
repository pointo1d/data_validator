# Define/extend global data type classes to provide data validation methods
# specific to/for the DataValidator module

require 'log_wrapper'
require 'data_validator/validation_result'
require 'data_validator/classes/base'

class Payment
  include LogWrapper
  extend DataValidator::Base

  def self.builder
    info "#{self}.builder()"

    ret = allocate
    info "#{self}.builder(): #{ret}"
    ret
  end

  def valid_value?(data)
    info "#{self}.valid_value?(#{data})"

    ret = data.class != Payment || data.to_s !~ %r{^\d*(\.\d+)?$}
    info "#{self}.valid_value?():: #{ret})"
    ret
  end

  def valid?(data)
    info "#{self}.valid?(#{data})"

    ret = DataValidator::ValidationResult.new
    ret.bad!(self, data) unless self.valid_value?(data)

    info "#{self}.valid?(): #{ret}"
    ret
  end
end

#### END OF FILE
