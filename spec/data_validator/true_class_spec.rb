# Bespoke gems/libraries
require 'data_validator/classes/true_class'

RSpec.describe 'TrueClass class methods' do
  [:builder, :valid?].each_with_index do |m, i|
    it "#{i+1}. TrueClass.#{m}()" do
      expect { TrueClass.respond_to?(m) }.not_to raise_error
    end
  end
end

RSpec.describe 'TrueClass constructor' do
  it "TrueClass.builder() not to raise exception" do
    expect { TrueClass.builder }.not_to raise_error
  end

  it "TrueClass.builder() creates correct class of object" do
    expect(TrueClass.builder).to be_a(TrueClass)
  end
end

RSpec.describe 'TrueClass instance methods' do
  [:valid?, :valid_value?].each_with_index do |m, i|
    it "{o}.#{m}" do
      expect { TrueClass.builder.respond_to?(m) }.not_to raise_error
    end
  end
end

RSpec.describe 'TrueClass comparison - GP' do
  [
    [ TrueClass,  TrueClass ],
    [ TrueClass,  true,     ],
    [ TrueClass,  'true',   ],
    [ true,       true      ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.valid?(d) }.not_to raise_error
      expect(@ret.normalize).to be_empty
    end
  end
end

RSpec.describe 'TrueClass comparison - BP' do
  [
    [ false,     TrueClass  ],
    [ 'false',   TrueClass  ],
    [ TrueClass,  false     ],
    [ TrueClass,  'false'   ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.valid?(d) }.not_to raise_error
      expect(@ret.normalize).not_to be_empty
    end
  end
end

#### END OF FILE
