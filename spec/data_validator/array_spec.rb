# Bespoke gems/libraries
require 'data_validator/classes/array'

RSpec.describe 'Array class methods' do
  [:builder, :valid?].each_with_index do |m, i|
    it "#{i+1}. Array.#{m}()" do
      expect { Array.respond_to?(m) }.not_to raise_error
      expect(Array.respond_to?(m)).to be true
    end
  end
end

RSpec.describe 'Array constructor' do
  it "Array.builder() not to raise exception" do
    expect { Array.builder }.not_to raise_error
  end

  it "Array.builder() creates correct class of object" do
    expect(Array.builder).to be_a(Array)
  end
end

RSpec.describe 'Array instance methods' do
  [:valid?, :valid_value?].each_with_index do |m, i|
    it "Array##{m}" do
      expect { Array.builder.respond_to?(m) }.not_to raise_error
    end
  end
end

RSpec.describe 'Array - GP' do
  [
    [Array,     Array             ],
    [Array,     []                ],
    [[],        []                ],
    [[Array],   [[]]              ],
    [[Integer], [1, 2]            ],
    [[String],  ['str1', 'str2']  ],
  ].each_with_index do |(c,d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.valid?(d) }.not_to raise_error
      expect(@ret.normalize).to be_empty, "Expected empty, got #{@ret}"
    end
  end
end

RSpec.describe 'Array - BP' do
  [
    [[],        Array,            ],
  ].each_with_index do |(c,d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.valid?(d) }.not_to raise_error
      expect(@ret.normalize).to be_empty, "Expected empty, got #{@ret}"
    end
  end
end

#### END OF FILE
