# Define/extend global String class to provide data validation methods
# specific to/for the DataValidator module

require 'log_wrapper'
require 'data_validator/validation_result'
require 'data_validator/classes/base'

class StringOrNull
  include LogWrapper
  extend DataValidator::Base

  def self.builder
    info "#{self}.builder()"
    ret = allocate
    info "#{self}.builder(): #{ret}"
    ret
  end

  def valid_value?(data)
    info "#{self}.valid_value?(#{data}) - #{data.class}"

    ret = !data.nil? && (
      String.valid?(data).is_good? ||
      !(data.to_s =~ %r{^(StringOrNull|null)$}).nil?
    )

    info "#{self}.valid_value?():: #{ret}"
    ret
  end

  def valid?(data)
    info "#{self}.valid?(#{data}) - #{data.class}"

    ret = DataValidator::ValidationResult.new
    ret.bad!(self, data) unless valid_value?(data)

    info "#{self}.valid?():: #{ret}"
    ret
  end
end

#### END OF FILE
