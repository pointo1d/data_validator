# Bespoke gems/libraries
require 'data_validator/classes/payment'

RSpec.describe 'Payment class methods' do
  [:builder, :valid?].each_with_index do |m, i|
    it "#{i+1}. Payment.#{m}()" do
      expect { Payment.respond_to?(m) }.not_to raise_error
      expect(Payment.respond_to?(m)).to be true
    end
  end
end

RSpec.describe 'Payment constructor' do
  it "Payment.builder() not to raise exception" do
    expect { Payment.builder }.not_to raise_error
  end

  it "Payment.builder() creates correct class of object" do
    expect(Payment.builder).to be_a(Payment)
  end
end

RSpec.describe 'Payment instance methods' do
  [:valid?, :valid_value?].each_with_index do |m, i|
    it "{o}.#{m}" do
      expect { Payment.builder.respond_to?(m) }.not_to raise_error
    end
  end
end

RSpec.describe 'Payment - GP' do
  [
    [ Payment,  Payment ],
    [ Payment,  1       ],
    [ Payment,  1.12    ],
    [ Payment,  0.112   ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.valid?(d) }.not_to raise_error
      expect(@ret.normalize).to be_empty, "Got #{@ret.normalize}"
    end
  end
end

RSpec.describe 'Payment - BP' do
  [
    [ 1,        Payment ],
    [ '1',      Payment ],
    [ 1.12,     Payment ],
    [ '1.12',   Payment ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. ! #{c}.valid?(#{d})" do
      expect { @ret = c.valid?(d) }.not_to raise_error
      expect(@ret.normalize).not_to be_empty
    end
  end
end

#### END OF FILE
