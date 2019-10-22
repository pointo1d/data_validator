# Bespoke gems/libraries
require 'data_validator/classes/hash'

RSpec.describe 'Hash class methods' do
  [:builder, :valid?].each_with_index do |m, i|
    it "#{i+1}. Hash.#{m}()" do
      expect { Hash.respond_to?(m) }.not_to raise_error
      expect(Hash.respond_to?(m)).to be true
    end
  end
end

RSpec.describe 'Hash constructor' do
  it "Hash.builder() not to raise exception" do
    expect { Hash.builder }.not_to raise_error
  end

  it "Hash.builder() creates correct class of object" do
    expect(Hash.builder).to be_a(Hash)
  end
end

RSpec.describe 'Hash instance methods' do
  [:valid?, :valid_value?].each_with_index do |m, i|
    it "{o}.#{m}" do
      expect { Hash.builder.respond_to?(m) }.not_to raise_error
    end
  end
end

RSpec.describe 'Hash - GP' do
  [
    [Hash,                            Hash                        ],
    [Hash,                            {}                          ],
    [{},                              Hash                        ],
    [{},                              {}                          ],
    [{:a          => Boolean},        {:a    => 'true'}           ],
    [{:a          => Integer},        {:a    => 1234}             ],
    [{:a          => Array},          {:a    => []}               ],
    [{:a          => []},             {:a    => []}               ],
    [{:a          => Hash},           {:a    => {}}               ],
    [{:a          => {}},             {:a    => {}}               ],
    [{Integer     => Integer},        {1234  => 99}               ],
    [{/^\d+$/     => Integer},        {4567  => 12}               ],
    [{:key        => FloatOrNull},    {:key  => 12.456}           ],
    [{:key        => FloatOrNull},    {:key  => nil}              ],
    [{:key        => IntegerOrNull},  {:key  => 123456}           ],
    [{:key        => IntegerOrNull},  {:key  => 'null'}           ],
    [{Integer     => Integer},        {1234  => 99, 1235  => 100} ],
    [{Integer     => Array},          {4567  => [], 4568  => []}  ],
    [{Integer     => []},             {4567  => [], 4568  => []}  ],
    [{/^\d+-\d+$/ => String},         {'1-4' => 'wtaf'},          ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. #{c}.valid?(#{d})" do
      expect { @ret = c.valid?(d) }.not_to raise_error
      expect(@ret.normalize).to be_empty, "Got #{@ret.normalize}"
    end
  end
end

RSpec.describe 'Hash - BP' do
  [
    [Hash,                            []                                    ],
    [{},                              1234                                  ],
    [{:a          => Boolean},        {:a     => 1234}                      ],
    [{:a          => Integer},        {:a     => true}                      ],
    [{:a          => Array},          {:a     => {}}                        ],
    [{:a          => []},             {:a     => 12}                        ],
    [{:a          => Hash},           {:a     => 1.2}                       ],
    [{:a          => {}},             {:b     => {}}                        ],
    [{Integer     => Integer},        {12.4   => 99}                        ],
    [{/^\d+$/     => Integer},        {'a467' => 12}                        ],
    [{:key        => FloatOrNull},    {:key   => 125456}                    ],
    [{:key        => FloatOrNull},    {:key   => :nil}                      ],
    [{:key        => IntegerOrNull},  {:key   => 123.56}                    ],
    [{:key        => IntegerOrNull},  {:key   => 'nil'}                     ],
    [{Integer     => Integer},        {1234   => 99, 1235  => 1.0}          ],
    [{Integer     => Array},          {:a457  => [], 4568  => {}}           ],
    [{Integer     => []},             {4567   => [], 4568  => 23}           ],
    [{Integer     => Hash},           {4567   => [], 4568  => []}           ],
    [{Integer     => []},             {4567   => [], 4568  => 23}           ],
    [{/^\d+-\d+$/ => String},         {'1-4'  => 'wtaf', '154'  => 'wtaf'}, ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. ! #{c}.valid?(#{d})" do
      expect { @ret = c.valid?(d) }.not_to raise_error
      expect(@ret.normalize).not_to be_empty
    end
  end
end

#### END OF FILE
