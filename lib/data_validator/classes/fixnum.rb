# Define/extend global data type classes to provide data validation methods
# specific to/for the DataValidator module

require 'log_wrapper'
require 'data_validator/classes/base'
require 'data_validator/validation_result'

class Fixnum
  include LogWrapper
  extend DataValidator::Base

  #def self.builder
  #  info "#{self}.builder()"
  #  ret = (rand * 10).to_i
  #  info "#{self}.builder(): #{ret}"
  #  ret
  #end

  def valid_value?(data)
    info "#{self}.valid_value?(#{data}) - #{data.class}"
    
    ret = !data.nil? && (
      (data == Fixnum || data.class == Fixnum) &&
      !(data.to_s =~ %r{^\d+$}).nil?
    )
    info "#{self}.valid_value?(): #{ret}"
    ret    
  end

  #def valid?(data)
  #  info "#{self}.valid?(#{data})"
#
#    ret = DataValidator::ValidationResult.new
#    ret.bad!(self, data) unless valid_value?(data)
#
#    info "#{self}.valid?(): #{ret}"
#    ret
#  end
end

#### END OF FILE
