# Bespoke gems/libraries
require 'data_validator/classes/date'

RSpec.describe 'Date class methods' do
  [:builder, :valid?].each_with_index do |m, i|
    it "#{i+1}. Date.#{m}()" do
      expect { Date.respond_to?(m) }.not_to raise_error
      expect(Date.respond_to?(m)).to be true
    end
  end
end

RSpec.describe 'Date constructor' do
  it "Date.builder() not to raise exception" do
    expect { Date.builder }.not_to raise_error
  end

  it "Date.builder() creates correct class of object" do
    expect(Date.builder).to be_a(Date)
  end
end

RSpec.describe 'Date instance methods' do
  [:valid?, :valid_value?].each_with_index do |m, i|
    it "{o}.#{m}" do
      expect { Date.builder.respond_to?(m) }.not_to raise_error
    end
  end
end

RSpec.describe 'Date - GP' do
  [
    [ Date,         '2018-02-01'  ],
    [ '2018-02-01', '2018-02-01'  ],
    [ Date,         Date      ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).to be_empty, "Got #{@ret.normalize}"
    end
  end
end

RSpec.describe 'Date - BP' do
  [
    [ Date,         nil       ],
    [ Date,         '123-22-' ],
    [ '2017-01-01', Date      ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. ! #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).not_to be_empty
    end
  end
end

#### END OF FILE
