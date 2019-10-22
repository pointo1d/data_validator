# Define/extend global data type classes to provide data validation methods
# specific to/for the DataValidator module

require 'log_wrapper'
require 'data_validator/validation_result'
require 'data_validator/classes/base'

class PaymentOrNull
  include LogWrapper
  extend DataValidator::Base

  def self.builder
    info "#{self}.new()"
    ret = allocate
    info "#{self}.new(): #{ret}"
    ret
  end

  def valid_value?(data)
    info "#{self}.valid_value?(#{data})"

    ret = !data.nil? && (
      Payment.valid?(data).is_good? ||
      !(data.to_s =~ %r{^(PaymentOrNull|null)$}).nil?
    )
    info "#{self}.valid_value?():: #{ret}"
    ret
  end

  def valid?(data)
    info "#{self}.valid?(#{data})"

    ret = DataValidator::ValidationResult.new()
    ret.bad!(self, data) unless valid_value?(data)
    info "#{self}.valid?(): #{ret}"
    ret
  end
end

#### END OF FILE
