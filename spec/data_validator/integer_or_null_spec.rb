# Bespoke gems/libraries
require 'data_validator/classes/integer_or_null'

RSpec.describe 'IntegerOrNull class methods' do
  [:builder, :valid?].each_with_index do |m, i|
    it "#{i+1}. IntegerOrNull.#{m}()" do
      expect { IntegerOrNull.respond_to?(m) }.not_to raise_error
      expect(IntegerOrNull.respond_to?(m)).to be true
    end
  end
end

RSpec.describe 'IntegerOrNull constructor' do
  it "IntegerOrNull.builder() not to raise exception" do
    expect { IntegerOrNull.builder }.not_to raise_error
  end

  it "IntegerOrNull.builder() creates correct class of object" do
    expect(IntegerOrNull.builder).to be_a(IntegerOrNull)
  end
end

RSpec.describe 'IntegerOrNull instance methods' do
  [:valid?, :valid_value?].each_with_index do |m, i|
    it "{o}.#{m}" do
      expect { IntegerOrNull.builder.respond_to?(m) }.not_to raise_error
    end
  end
end

RSpec.describe 'IntegerOrNull - GP' do
  [
    [ IntegerOrNull,  IntegerOrNull ],
    [ IntegerOrNull,  123456        ],
    [ IntegerOrNull,  'null'        ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).to be_empty, "Got #{@ret.normalize}"
    end
  end
end

RSpec.describe 'IntegerOrNull - BP' do
  [
    [ IntegerOrNull,  nil           ],
    [ 987654,         IntegerOrNull ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. ! #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).not_to be_empty
    end
  end
end

#### END OF FILE
