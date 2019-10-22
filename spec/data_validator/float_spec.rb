# Bespoke gems/libraries
require 'data_validator/classes/float'

RSpec.describe 'Float class methods' do
  [:builder, :valid?].each_with_index do |m, i|
    it "#{i+1}. Float.#{m}()" do
      expect { Float.respond_to?(m) }.not_to raise_error
      expect(Float.respond_to?(m)).to be true
    end
  end
end

RSpec.describe 'Float constructor' do
  it "Float.builder() not to raise exception" do
    expect { Float.builder }.not_to raise_error
  end

  it "Float.builder() creates correct class of object" do
    expect(Float.builder).to be_a(Float)
  end
end

RSpec.describe 'Float instance methods' do
  [:valid?, :valid_value?].each_with_index do |m, i|
    it "{o}.#{m}" do
      expect { Float.builder.respond_to?(m) }.not_to raise_error
    end
  end
end

RSpec.describe 'validate_data():: Float - GP' do
  [
    [ Float,  1.0   ],
    [ 1.23,   1.23  ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).to be_empty, "Got #{@ret}"
    end
  end
end

RSpec.describe 'validate_data():: Float - BP' do
  [
    [ Float,  Float   ],
    [ Float,  nil     ],
    [ Float,  '9,99'  ],
    [ 1.23,   Float,  ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. ! #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).not_to be_empty
    end
  end
end

#### END OF FILE
