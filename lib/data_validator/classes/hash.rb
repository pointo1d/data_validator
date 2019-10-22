# Define/extend global data type classes to provide data validation methods
# specific to/for the DataValidator module

require 'data_validator/validation_result'
require 'data_validator/classes/base'

class Hash
  extend DataValidator::Base
  include LogWrapper

  class DataValidatorError      < StandardError; end
  class KeyNotFoundError        < DataValidatorError; end

  def self.builder
    info "#{self}.builder()"
    ret = Hash.new
    info "#{self}.builder(): #{ret}"
    ret
  end

  # Method to validate the hash self against the given definition
  def valid_value?(data)
    info "#{self}.valid?(#{data})"

    ret = DataValidator::ValidationResult.new

    if !data.is_a?(Hash) && !data.class.is_a?(Hash) && data != Hash
      ret.bad!(self, data)
    elsif self == Hash && !data.class.is_a?(Hash) && data != Hash 
      ret.bad!(self, data)
    elsif data == Hash || data == self
    else
      keys = (data.keys | self.keys).uniq
      debug "#{self}.valid?() - self != data - keys: #{keys}"
      loop_num = 1

      # The data and it's definition are both hashes and aren't directly
      # equal, so continue ....
      # Start by going through the keys in both the data
      # structure itself c/w the data definition. Note that keys & values in
      # the data definition can be as per standard # hash keys, in addition to
      # which, they may also be class names or regular expressions - for the
      # purposes of range definition/limitation
      keys.each do |key|
        debug "#{self}.valid?() - LOOP #{loop_num} TOP"
        debug "#{self}.valid?() - key: #{key}, data: #{data} (#{data.class})"
        debug "#{self}.valid?() - data[key]: #{data[key]}"
        debug "#{self}.valid?() - key.class: #{key.class}"

        if self.has_key?(key) && data.has_key?(key)
          # Key exists in both data & the definition, so the comparision is a
          # simple one in as much as we only need to validate the data value
          # against its' definition assuming it's a symbol
          debug "#{self}.valid?() - SIMPLE PRE"
          if key.class == Symbol
            ret.merge!(self[key].send(:valid?, data[key]))
          else
            ret.bad!(self[key], data[key])
          end
          debug "#{self}.valid?() - SIMPLE POST"
        else
          # Key exists in one, or less, of the data or definition hashes, so
          # it's a definition of a type/class name or missing or extra
          debug "#{self}.valid?() - COMPLEX key: #{key}, data: #{data}"

          if data.has_key?(key)
            # The key's in the data, so attempt to validate it and its' value
            # using the definition assuming the data isn't a validating
            # class (c/w an instance)
            debug "#{self}.valid?() - COMPLEX DATA PRE 1"
            if key.class == Symbol
              ret.extra!(self[key], data[key])
            else
              debug "#{self}.valid?() - COMPLEX DATA PRE 2"
              ret.merge!(self.keys.first.send(:valid?, key))
              debug "#{self}.valid?() - COMPLEX DATA PRE 3"
              ret.merge!(self.values.first.send(:valid?, data[key]))
            end
            debug "#{self}.valid?() - COMPLEX DATA PRE 4"
          end
        end
        loop_num += 1
      end
    end

    info "#{self}.valid?(): #{ret}"
    ret
  end

  def valid?(data)
    info "#{self}.valid?(#{data}) - #{data.class}"

    ret = valid_value?(data) 

    info "#{self}.valid?(): #{ret}"
    ret
  end
end

#### END OF FILE
