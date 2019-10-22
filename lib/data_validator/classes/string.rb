# Define/extend global String class to provide data validation methods
# specific to/for the DataValidator module

require 'log_wrapper'
require 'data_validator/validation_result'
require 'data_validator/classes/base'

class String
  include LogWrapper
  extend DataValidator::Base

  def self.builder
    info "#{self}.builder()"
    ret = (0...8).map { (65 + rand(26)).chr }.join
    info "#{self}.builder(): #{ret}"
    ret
  end

  def valid?(data)
    info "#{self}.valid?(#{data})"

    ret = DataValidator::ValidationResult.new
    ret.bad!(data, self) if data.nil? || data.class != String

    info "#{self}.valid?(): #{ret}"
    ret
  end
end

#### END OF FILE
