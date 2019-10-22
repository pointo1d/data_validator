# Define/extend global data type classes to provide data validation methods
# specific to/for the DataValidator module

require 'log_wrapper'
require 'data_validator/normaliser/classification'

module DDB
  module DataValidator
    #
    # Class implementing a means to normalise the data and definition elements
    # of a validation the arguments such that data and defn are just that.
    # Self-evidently, it matters not if they're the same. Much of
    # this is predicated on the valid_value?() method being implemented by the
    # definition class.
    #
    class Normaliser

      extend LogWrapper
      include LogWrapper
      include Classification

      class DataNormaliserError       < StandardError; end

      #
      # Constructor taking the posited data and its' definition - use the
      # get_normalised() and get_actual() methods to access the normalised and
      # actual data & definitions + the normalised?() method to get the actual
      # data and definition + a flag to whether exchange was made during the
      # normalisation. The args are assumed to be the data and its'
      # definition ... and in that order
      #
      def initialize(a, b)
        info "#{self}.new(#{a}, #{b})"
        info "#{self}.new(#{a.class}, #{b.class})"

        @data = [a, b]

        # Nothing to do if any of the following hold ...
        # . They're identical
        # . They're both the same class
        # . The posited definition actually implements c/w inherits, value?()
        acl = classify(a)
        bcl = classify(b)
        debug "#{self}.new() - acl: #{acl}, bcl: #{bcl}"
        debug "#{self}.new() - #{bcl.class? && b.instance_methods(false).include?(:valid?)}"
        debug "#{self}.new() - #{bcl.object? && b.class.instance_methods(false).include?(:valid?)}"
        debug "#{self}.new() - #{a.class != Class && (a.class == b.class)}"
        debug "#{self}.new() - #{a.class == Class && (a == b)}"
        debug "#{self}.new() - #{a == b}"

        if (
          bcl.class? && b.instance_methods(false).include?(:valid?) 
        ) || (
          bcl.object? && b.class.instance_methods(false).include?(:valid?)
        ) || (
          a.class != Class  && (a.class == b.class)
        ) || (
          a.class == Class  && (a == b)
        ) || (
          a == b 
        )
          @normalised = false
        else
          @normalised = true
        end

        debug "#{self}.new(): #{@data}"

        info "#{self}.new(): normalised?: #{@normalised}"
      end

      def normalised?
        info "#{self}.normalised?()"
        info "#{self}.normalised?(): #{@normalised}"
        @normalised
      end

      def get_actual
        info "#{self}.get_actual()"

        ret = @data
 
        info "#{self}.get_actual(): #{ret}"
        ret
      end

      def get_normalised
        info "#{self}.get_normalised()"

        ret = normalised? ? @data.reverse : @data

        info "#{self}.get_normalised(): #{ret}"
        ret
      end
    end
  end
end

#### END OF FILE
