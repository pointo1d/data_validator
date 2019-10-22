# Define/extend global data type classes to provide data validation methods
# specific to/for the DataValidator module

require 'log_wrapper'

module DDB
  module DataValidator
    # 
    # Module providing a mix-in method classifying it's argument using the
    # following constraints...
    #
    # * scope     - :class or :object
    # * nature    - :simple or :complex
    # * validator - valid?() implementation is direct c/w inherited
    #
    module Classification

      extend LogWrapper
      include LogWrapper

      attr_reader :scope, :nature, :validator

      class Classifier
        include LogWrapper

        def initialize(val = nil)
          info "#{self}.new(#{val})"
          debug "#{self}.new() - #{val.class}"
          
          # Set defaults
          @nature = :simple
          @validator = false

          # Now override them as appropriate
          @scope = val.class == Class ? :class : :object
          @nature = type?(@scope, val)
          @validator = @scope == :class ?
            val.instance_methods(false).include?(:valid?) :
            val.class.instance_methods(false).include?(:valid?)
          info "#{self}.new() - #{@scope}, #{@nature}, #{@validator}"
          info "#{self}.new():"
        end

        def class?
          info "#{self}.class?()"
          ret = @scope == :class
          info "#{self}.class?(): #{ret}"
          ret
        end
      
        def object?
          info "#{self}.object?()"
          ret = @scope == :object
          info "#{self}.object?(): #{ret}"
          ret
        end
      
        def simple?
          info "#{self}.simple?()"
          ret = @nature == :simple
          info "#{self}.simple?(): #{ret}"
          ret
        end

        def complex?
          info "#{self}.complex?()"
          ret = @nature == :complex
          info "#{self}.complex?(): #{ret}"
          ret
        end

        def validator?
          info "#{self}.validator?()"
          ret = @validator
          info "#{self}.validator?(): #{ret}"
          ret
        end

        private
          def type?(e, a)
            info "#{self}.type?(#{e}, #{a})"

            a = e == :class ? a : a.class
            debug "#{self}.type?() - #{a}"
            if a.respond_to?(:classify?)
              debug "#{self}.type?() - sending..."
              ret = a.send(:classify?)
            else
              ret = (a.to_s =~ %r{^(Array|Hash|Proc)$}).nil? ?
                :simple : :complex
            end
            info "#{self}.type?(): #{ret}"
            ret
          end
      end

      def classify(a = nil)
        info "#{self}.classify(#{a})"
        a = self if a.nil?
        debug "#{self}.classify() - #{a}, #{a.class}"

        ret = Classifier.new(a)

        info "#{self}.classify(): #{ret}"
        return ret
      end
    end
  end
end

#### END OF FILE
