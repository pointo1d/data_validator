# Bespoke gems/libraries
require 'data_validator/classes/integer_or_null'

RSpec.describe 'FloatOrNull class methods' do
  [:builder, :valid?].each_with_index do |m, i|
    it "#{i+1}. FloatOrNull.#{m}()" do
      expect { FloatOrNull.respond_to?(m) }.not_to raise_error
      expect(FloatOrNull.respond_to?(m)).to be true
    end
  end
end

RSpec.describe 'FloatOrNull constructor' do
  it "FloatOrNull.builder() not to raise exception" do
    expect { FloatOrNull.builder }.not_to raise_error
  end

  it "FloatOrNull.builder() creates correct class of object" do
    expect(FloatOrNull.builder).to be_a(FloatOrNull)
  end
end

RSpec.describe 'FloatOrNull instance methods' do
  [:valid?, :valid_value?].each_with_index do |m, i|
    it "{o}.#{m}" do
      expect { FloatOrNull.builder.respond_to?(m) }.not_to raise_error
    end
  end
end

RSpec.describe 'validate_data():: FloatOrNull - GP' do
  [
    [ FloatOrNull,  FloatOrNull ],
    [ FloatOrNull,  123.56  ],
    [ FloatOrNull,  nil     ],
    [ FloatOrNull,  'null'  ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).to be_empty, "Got #{@ret}"
    end
  end
end

RSpec.describe 'validate_data():: FloatOrNull - BP' do
  [
    [ 9.7654,         FloatOrNull ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. ! #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).not_to be_empty, "Got #{@ret}"
    end
  end
end

#### END OF FILE
