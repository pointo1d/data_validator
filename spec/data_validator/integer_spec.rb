# Bespoke gems/libraries
require 'data_validator/classes/integer'

RSpec.describe 'Integer class methods' do
  [:builder, :valid?].each_with_index do |m, i|
    it "#{i+1}. Integer.#{m}()" do
      expect { Integer.respond_to?(m) }.not_to raise_error
      expect(Integer.respond_to?(m)).to be true
    end
  end
end

RSpec.describe 'Integer constructor' do
  it "Integer.builder() not to raise exception" do
    expect { Integer.builder }.not_to raise_error
  end

  it "Integer.builder() creates correct class of object" do
    expect(Integer.builder).to be_a(Integer)
  end
end

RSpec.describe 'Integer instance methods' do
  [:valid?, :valid_value?].each_with_index do |m, i|
    it "{o}.#{m}" do
      expect { Integer.builder.respond_to?(m) }.not_to raise_error
    end
  end
end

RSpec.describe 'Integer - GP' do
  [
    [ Integer,  123     ],
    [ 23456,    23456   ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).to be_empty, "Got #{@ret.normalize}"
    end
  end
end

RSpec.describe 'Integer - BP' do
  [
    [ Integer,  Integer ],
    [ Integer,  nil     ],
    [ Integer,  '123'   ],
    [ 123,      Integer ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. ! #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).not_to be_empty
    end
  end
end

#### END OF FILE
