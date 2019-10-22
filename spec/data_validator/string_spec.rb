# Bespoke gems/libraries
require 'data_validator/classes/string'

RSpec.describe 'String class methods' do
  [:builder, :valid?].each_with_index do |m, i|
    it "#{i+1}. String.#{m}()" do
      expect { String.respond_to?(m) }.not_to raise_error
      expect(String.respond_to?(m)).to be true
    end
  end
end

RSpec.describe 'String constructor' do
  it "String.builder() not to raise exception" do
    expect { String.builder }.not_to raise_error
  end

  it "String.builder() creates correct class of object" do
    expect(String.builder).to be_a(String)
  end
end

RSpec.describe 'String instance methods' do
  [:valid?, :valid_value?].each_with_index do |m, i|
    it "{o}.#{m}" do
      expect { String.builder.respond_to?(m) }.not_to raise_error
    end
  end
end

RSpec.describe 'validate_data():: String - GP' do
  [
    [ String,         'some string' ],
    [ 'same string',  'same string' ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).to be_empty, "Got #{@ret}"
    end
  end
end

RSpec.describe 'validate_data():: String - BP' do
  [
    [ String,   String  ],
    [ String,   nil     ],
    [ '123',     String ],
    [ 123,      String  ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. ! #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).not_to be_empty, "Got #{@ret}"
    end
  end
end


#### END OF FILE
