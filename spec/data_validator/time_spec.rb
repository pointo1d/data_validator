# Bespoke gems/libraries
require 'data_validator/classes/time'

RSpec.describe 'Time class methods' do
  [:builder, :valid?].each_with_index do |m, i|
    it "#{i+1}. Time.#{m}()" do
      expect { Time.respond_to?(m) }.not_to raise_error
      expect(Time.respond_to?(m)).to be true
    end
  end
end

RSpec.describe 'Time constructor' do
  it "Time.builder() not to raise exception" do
    expect { Time.builder }.not_to raise_error
  end

  it "Time.builder() creates correct class of object" do
    expect(Time.builder).to be_a(Time)
  end
end

RSpec.describe 'Time instance methods' do
  [:valid?, :valid_value?].each_with_index do |m, i|
    it "{o}.#{m}" do
      expect { Time.builder.respond_to?(m) }.not_to raise_error
    end
  end
end

RSpec.describe 'validate_data():: Time - GP' do
  [
    [ Time, '11:00:00'   ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).to be_empty, "Got #{@ret}"
    end
  end
end

RSpec.describe 'validate_data():: Time - BP' do
  [
    [ Time,  Time   ],
    [ Time,  nil     ],
    [ Time,  '9,99'  ],
    [ 1.23,   Time,  ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. ! #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).not_to be_empty
    end
  end
end

#### END OF FILE
