# Bespoke gems/libraries
require 'data_validator/classes/false_class'

RSpec.describe 'FalseClass class methods' do
  [:builder, :valid?].each_with_index do |m, i|
    it "#{i+1}. FalseClass.#{m}()" do
      expect(FalseClass.respond_to?(m)).to be true
    end
  end
end

RSpec.describe 'FalseClass constructor' do
  it "FalseClass.builder() not to raise exception" do
    expect { FalseClass.builder }.not_to raise_error
  end

  it "TrueClass.builder() creates correct class of object" do
    expect(FalseClass.builder).to be_a(FalseClass)
  end
end

RSpec.describe 'FalseClass instance methods' do
  [:valid?, :valid_value?].each_with_index do |m, i|
    it "{o}.#{m}" do
      expect(FalseClass.builder.respond_to?(m)).to be true
    end
  end
end

RSpec.describe 'FalseClass comparison - GP' do
  [
    [ FalseClass,  FalseClass ],
    [ FalseClass,  false,     ],
    [ FalseClass,  'false',   ],
    [ false,       false      ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.valid?(d) }.not_to raise_error
      expect(@ret.normalize).to be_empty, "Expected empty, got #{@ret}"
    end
  end
end

RSpec.describe 'FalseClass comparison - BP' do
  [
    [ true,     FalseClass  ],
    [ 'true',   FalseClass  ],
    [ FalseClass,  true     ],
    [ FalseClass,  'true'   ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. ! #{c}.valid?(#{d})" do
      expect { @ret = c.valid?(d) }.not_to raise_error
      expect(@ret.normalize).not_to be_empty
    end
  end
end

#### END OF FILE
