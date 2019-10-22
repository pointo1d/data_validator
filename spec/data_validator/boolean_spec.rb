# Bespoke gems/libraries
require 'data_validator/classes/boolean'

RSpec.describe 'Boolean class methods' do
  [:builder, :valid?].each_with_index do |m, i|
    it "#{i+1}. Boolean.#{m}()" do
      expect { Boolean.respond_to?(m) }.not_to raise_error
      expect(Boolean.respond_to?(m)).to be true
    end
  end
end

RSpec.describe 'Boolean constructor' do
  it "Boolean.builder() not to raise exception" do
    expect { Boolean.builder }.not_to raise_error
  end

  it "Boolean.builder() creates correct class of object" do
    expect(Boolean.builder).to be_a(Boolean)
  end
end

RSpec.describe 'Boolean instance methods' do
  [:valid?, :valid_value?].each_with_index do |m, i|
    it "{o}.#{m}" do
      expect { Boolean.builder.respond_to?(m) }.not_to raise_error
    end
  end
end

RSpec.describe 'Boolean comparison - GP' do
  [
    [ Boolean,  Boolean   ],
    [ Boolean,  true,     ],
    [ Boolean,  'true',   ],
    [ Boolean,  false     ],
    [ Boolean,  :false    ],
    [ true,     true      ],
    [ false,     false    ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret).to be_a(DataValidator::ValidationResult)
      expect(@ret.normalize).to be_empty, "Got #{@ret.normalize}"
    end
  end
end

RSpec.describe 'Boolean comparison - BP' do
  [
    [ true,     Boolean   ],
    [ false,    Boolean   ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. ! #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error()
      expect(@ret.normalize).not_to be_empty, "got #{@ret}"
    end
  end
end

#### END OF FILE
