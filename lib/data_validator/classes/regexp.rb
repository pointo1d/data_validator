# Define/extend global data type classes to provide data validation methods
# specific to/for the DataValidator module

require 'log_wrapper'
require 'data_validator/classes/base'
require 'data_validator/validation_result'

class Regexp
  include LogWrapper
  extend DataValidator::Base

  class RegexpError       < StandardError; end
  class EmptyRegexError  < RegexpError; end

  def self.builder
    info "#{self}.builder()"
    # Generate an RE almost guaranteed to never match under normal circs
    ret = /#{[*('a'..'z'),*('0'..'9')].shuffle[0,8].join}/
    info "#{self}.builder(): #{ret}"
    ret
  end

  def valid_value?(data)
    info "#{self}.valid_value?(#{data}) - (#{data.class}, #{data.nil?})"

    ret = !data.nil? && self.to_s != '(?-mix:)' && (
      data.class == Regexp || data == Regexp || !(data.to_s =~ self).nil?
    )

    info "#{self}.valid_value?():: #{ret}"
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
