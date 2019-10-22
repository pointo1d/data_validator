# Bespoke gems/libraries
require 'data_validator/classes/payment_or_null'

RSpec.describe 'PaymentOrNull class methods' do
  [:builder, :valid?].each_with_index do |m, i|
    it "#{i+1}. PaymentOrNull.#{m}()" do
      expect { PaymentOrNull.respond_to?(m) }.not_to raise_error
      expect(PaymentOrNull.respond_to?(m)).to be true
    end
  end
end

RSpec.describe 'PaymentOrNull constructor' do
  it "PaymentOrNull.builder() not to raise exception" do
    expect { PaymentOrNull.builder }.not_to raise_error
  end

  it "PaymentOrNull.builder() creates correct class of object" do
    expect(PaymentOrNull.builder).to be_a(PaymentOrNull)
  end
end

RSpec.describe 'PaymentOrNull instance methods' do
  [:valid?, :valid_value?].each_with_index do |m, i|
    it "PaymentOrNull\##{m}" do
      expect { PaymentOrNull.builder.respond_to?(m) }.not_to raise_error
    end
  end
end

RSpec.describe 'PaymentOrNull - GP' do
  [
    [ PaymentOrNull,  1             ],
    [ PaymentOrNull,  '1'           ],
    [ PaymentOrNull,  1.12          ],
    [ PaymentOrNull,  '1.12'        ],
    [ PaymentOrNull,  'null'        ],
    [ PaymentOrNull,  PaymentOrNull ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.valid?(d) }.not_to raise_error
      expect(@ret.normalize).to be_empty, "Expected empty, got #{@ret}"
    end
  end
end

RSpec.describe 'PaymentOrNull - BP' do
  [
    [ 1,              PaymentOrNull ],
    [ '1',            PaymentOrNull ],
    [ 1.12,           PaymentOrNull ],
    [ '1.12',         PaymentOrNull ],
    [ 'null',         PaymentOrNull ],
    [ nil,            PaymentOrNull ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. ! #{c}.valid?(#{d})" do
      expect { @ret = c.valid?(d) }.not_to raise_error
      expect(@ret.normalize).not_to be_empty, "Expected empty, got #{@ret}"
    end
  end
end

#### END OF FILE
