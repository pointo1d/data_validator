# Bespoke gems/libraries
require 'data_validator/classes/integer_or_null'

RSpec.describe 'StringOrNull class methods' do
  [:builder, :valid?].each_with_index do |m, i|
    it "#{i+1}. StringOrNull.#{m}()" do
      expect { StringOrNull.respond_to?(m) }.not_to raise_error
      expect(StringOrNull.respond_to?(m)).to be true
    end
  end
end

RSpec.describe 'StringOrNull constructor' do
  it "StringOrNull.builder() not to raise exception" do
    expect { StringOrNull.builder }.not_to raise_error
  end

  it "StringOrNull.builder() creates correct class of object" do
    expect(StringOrNull.builder).to be_a(StringOrNull)
  end
end

RSpec.describe 'StringOrNull instance methods' do
  [:valid?, :valid_value?].each_with_index do |m, i|
    it "{o}.#{m}" do
      expect { StringOrNull.builder.respond_to?(m) }.not_to raise_error
    end
  end
end

RSpec.describe 'validate_data():: StringOrNull - GP' do
  [
    [ StringOrNull,  StringOrNull ],
    [ StringOrNull,  '123456'     ],
    [ StringOrNull,  'null'       ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).to be_empty, "Got #{@ret.normalize}"
    end
  end
end

RSpec.describe 'validate_data():: StringOrNull - BP' do
  [
    [ StringOrNull,  nil          ],
    [ StringOrNull,  123456       ],
    [ 987654,        StringOrNull ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. ! #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).not_to be_empty
    end
  end
end

#### END OF FILE
