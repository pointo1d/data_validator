# Define/extend global data type classes to provide data validation methods
# specific to/for the DataValidator module

require 'log_wrapper'
require 'data_validator/validation_result'
require 'data_validator/classes/base'

class Time
  include LogWrapper
  extend DataValidator::Base

  def self.builder
    info "#{self}.builder()"

    ret = Time.now
    info "#{self}.builder(): #{ret}"
    ret
  end

  def valid?(data)
    info "#{self}.valid?(#{data}) - #{data.class}"

    ret = DataValidator::ValidationResult.new
    ret.bad!(self, data) unless
      data.class.to_s =~ %r{^(String|Time)$} &&
      data.to_s =~ %r{^[0-2][0-9]:[0-5][0-9]:[0-5][0-9]$}

    info "#{self}.valid?(): #{ret}"
    ret
  end
end

#### END OF FILE
