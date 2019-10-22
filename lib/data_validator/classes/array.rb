# Define/extend global data type classes to provide data validation methods
# specific to/for the DataValidator module

require 'log_wrapper'
require 'data_validator/validation_result'
require 'data_validator/classes/base'

class Array
  include LogWrapper
  extend DataValidator::Base

  def self.builder
    info "#{self}.builder()"
    ret = Array.new
    info "#{self}.builder(): #{ret}"
    ret
  end

  # Class method to validate the array (self) against the given definition
  def valid_value?(data)
    info "#{self}.valid?(#{data})"

    ret = DataValidator::ValidationResult.new

    if !data.is_a?(Array) && !data.class.is_a?(Array) && data != Array
      ret.bad!(self, data)
    elsif self == Array && !data.class.is_a?(Array) && data != Array 
      ret.bad!(self, data)
    elsif data == Array || data == self
    else
      defn = self.first

      data.each do |el|
        debug "#{self}.valid?() - defn: #{defn}, el: #{el}"
        responds = el.respond_to?(:valid?)
        debug "#{self}.valid?() - defn: #{defn}, responds: #{responds}"

        if defn.respond_to?(:valid?)
          defn.valid?(el)
        elsif el.respond_to?(:valid?)
          debug "#{self}.valid?() - el - ret: #{ret}, #{}"
          ret.merge!(el.send(:valid?, el, defn))
          debug "#{self}.valid?() - ret: #{ret}"
        elsif defn_responds
          debug "#{self}.valid?() - defn - ret: #{ret}, #{}"
          ret.merge!(defn.send(:valid?, el, defn))
          debug "#{self}.valid?() - ret: #{ret}"
        else
          debug "#{self}.valid?() - else - ret: #{ret}, #{}"
          ret.bad!(defn, data) if data != defn
        end
      end
    end

    info "#{self}.valid?() - ret: #{ret}"
    ret
  end

  def valid?(data)
    info "{self}.valid?(#{data})"
    ret = valid_value?(data)
    info "{self}.valid?():: #{ret}"
    ret
  end
end

#### END OF FILE
