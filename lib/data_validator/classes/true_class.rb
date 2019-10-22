# Define/extend global data type classes to provide data validation methods
# specific to/for the DataValidator module

require 'log_wrapper'
require 'data_validator/classes/base'
require 'data_validator/validation_result'

class TrueClass
  include LogWrapper
  extend DataValidator::Base

  def self.builder
    info "#{self}.builder()"
    ret = true
    info "#{self}.builder(): #{ret}"
    ret
  end

  def valid_value?(data)
    info "#{self}.valid_value?(#{data})"
    info "#{self}.valid_value?() - #{data.class}"

    ret = (data.to_s =~ %r{^(TrueClass|true)$}).nil? ? false : true
    info "#{self}.valid_value?():#{ret}"
    ret
  end

  def valid?(data, *defn)
    info "#{self}.valid?(#{data} (#{data.class}), #{defn} (#{defn.class}))"
    defn = defn.first
    info "#{self}.valid?() - #{data.class}, #{defn.class}"

    ret = DataValidator::ValidationResult.new

    ret.bad!(data, defn) unless valid_value?(data)
    info "#{self}.valid?(): #{ret}"
    ret
  end
end

#### END OF FILE
