# Bespoke gems/libraries
require 'data_validator/classes/regexp'

RSpec.describe 'Regexp class methods' do
  [:builder, :valid?].each_with_index do |m, i|
    it "#{i+1}. Regexp.#{m}()" do
      expect { Regexp.respond_to?(m) }.not_to raise_error
      expect(Regexp.respond_to?(m)).to be true
    end
  end
end

RSpec.describe 'Regexp constructor' do
  it "Regexp.builder() not to raise exception" do
    expect { Regexp.builder }.not_to raise_error
  end

  it "Regexp.builder() creates correct class of object" do
    expect(Regexp.builder).to be_a(Regexp)
  end
end

RSpec.describe 'Regexp instance methods' do
  [:valid?, :valid_value?].each_with_index do |m, i|
    it "{o}.#{m}" do
      expect { Regexp.builder.respond_to?(m) }.not_to raise_error
    end
  end
end

RSpec.describe 'Regexp - GP' do
  [
    [ Regexp,   /123/,  ],
    [ /abc/,    /abc/   ],
    [ Regexp,   Regexp  ],
    [ /\w-\d/,  'a-4'   ]
  ].each_with_index do |(c, d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).to be_empty, "Got #{@ret.normalize}"
    end
  end
end

RSpec.describe 'Regexp - BP' do
  [
    [ Regexp,  nil     ],
    [ Regexp,  '123'   ],
    [ 123,      Regexp ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. ! #{c}.valid?(#{d})" do
      expect { @ret = c.send(:valid?, d) }.not_to raise_error
      expect(@ret.normalize).not_to be_empty
    end
  end
end

##### END OF FILE
