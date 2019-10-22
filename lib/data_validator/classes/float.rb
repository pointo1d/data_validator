# Define/extend global data type classes to provide data validation methods
# specific to/for the DataValidator module

require 'log_wrapper'
require 'data_validator/validation_result'
require 'data_validator/classes/base'

class Float
  include LogWrapper
  extend DataValidator::Base

  def self.builder
    info "#{self}.builder()"

    ret = (rand * 10).to_f
    info "#{self}.builder(): #{ret}"
    ret
  end

  def valid?(data)
    info "#{self}.is_valid?(#{data}) - #{data.class}"

    ret = DataValidator::ValidationResult.new
    ret.bad!(data, self) if 
      data.class != Float || data.to_s !~ %r{^\d+\.\d+$}

    info "#{self}.is_valid?(): #{ret}"
    ret
  end
end

#### END OF FILE
