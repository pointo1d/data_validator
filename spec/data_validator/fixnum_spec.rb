# Bespoke gems/libraries
require 'data_validator/classes/fixnum'

#RSpec.describe 'NilExpectedClassError for both class & object - BP' do
#  [
#    [ Boolean,  nil ],
#    [ false,    nil ],
#    [ true,     nil ],
#    [ Integer,  nil ],
#    [ 1,        nil ],
#    [ String,   nil ],
#    [ '1',      nil ],
#    [ Array,    nil ],
#    [ [],       nil ],
#    [ Hash,     nil ],
#    [ {},       nil ],
#  ].each_with_index do |a, i|
#    it "#{i+1} - NilExpectedClassError exception raised" do
#      expect {
#        validate_structure(*a)
#      }.to raise_error(DataValidatorError::NilExpectedClassError)
#    end
#  end
#end
#
#RSpec.describe 'Mismatch/non-equivs - GP' do
#  [
#    [ nil,      Integer ],
#    [ nil,      1       ],
#    [ nil,      Float   ],
#    [ nil,      1.0     ],
#    [ nil,      String  ],
#    [ nil,      '1'     ],
#    [ nil,      Array   ],
#    [ nil,      []      ],
#    [ nil,      Hash    ],
#    [ nil,      {}      ],
#    [ Array,    1       ],
#    [ [],       1       ],
#    [ 1,        []      ],
#    [ {},       1       ],
#    [ 1,        {}      ],
#  ].each_with_index do |a, i|
#    it "#{i+1}. #{a[0]} != #{a[1]}" do
#      expect { @ret = validate_structure(*a) }.not_to raise_error
#      expect(@ret).not_to be_empty
#    end
#  end
#end
#
#RSpec.describe 'validate_structure():: nil - GP' do
#  [
#    [ nil,            nil           ],
#  ].each_with_index do |a, i|
#    it "#{i+1}. #{a[0]} == #{a[1]}" do
#      expect { @ret = validate_structure(*a) }.not_to raise_error
#      expect(@ret).to be_empty, "Expected empty, got #{@ret}"
#    end
#  end
#end
#
#RSpec.describe 'validate_structure():: Boolean - GP' do
#  [
#    [ Boolean,  Boolean   ],
#    [ true,     Boolean   ],
#    [ 'true',   Boolean   ],
#    [ Boolean,  true,     ],
#    [ Boolean,  'true',   ],
#    [ true,     true      ],
#    [ false,     Boolean  ],
#    [ 'false',   Boolean  ],
#    [ Boolean,  false     ],
#    [ Boolean,  'false'   ],
#    [ false,    false     ],
#  ].each_with_index do |a, i|
#    it "#{i+1}. #{a[0]} == #{a[1]}" do
#      expect { @ret = validate_structure(*a) }.not_to raise_error
#      expect(@ret).to be_empty, "Expected empty, got #{@ret}"
#    end
#  end
#end
#
#RSpec.describe 'validate_structure():: Boolean - BP' do
#  [
#    [ nil,      Boolean   ],
#    [ nil,      false     ],
#    [ nil,      true      ],
#    [ :ttrue,   Boolean   ],
#    [ 'truee',  Boolean   ],
#    [ Boolean,  :faalse   ],
#    [ Boolean,  'ffalse'  ],
#    [ 1,        Boolean   ],
#    [ '1',      Boolean   ],
#    [ false,    :ffalse   ],
#    [ :truee,     true    ],
#  ].each_with_index do |a, i|
#    it "#{i+1}. #{a[0]} == #{a[1]}" do
#      expect { @ret = validate_structure(*a) }.not_to raise_error
#      expect(@ret).not_to be_empty, "Expected non-empty"
#    end
#  end
#end
#
#RSpec.describe 'validate_structure():: Integer - GP' do
#  [
#    [ Integer,        Integer       ],
#    [ Integer,        123           ],
#    [ Integer,        '123'         ],
#    [ 123,            Integer       ],
#    [ '123',          Integer       ],
#    [ IntegerOrNull,  IntegerOrNull ],
#    [ IntegerOrNull,  123456        ],
#    [ IntegerOrNull,  '123456'      ],
#    [ IntegerOrNull,  'null'        ],
#    [ 987654,         IntegerOrNull ],
#    [ '987654',       IntegerOrNull ],
#    [ 'null',         IntegerOrNull ],
#    [ nil,            IntegerOrNull ],
#    [ 23456,          23456         ],
#    [ '23456',        '23456'       ],
#  ].each_with_index do |a, i|
#    it "#{i+1}. #{a[0]} == #{a[1]}" do
#      expect { @ret = validate_structure(*a) }.not_to raise_error
#      expect(@ret).to be_empty, "Expected empty, got #{@ret}"
#    end
#  end
#end
#
#RSpec.describe 'validate_structure():: Float - GP' do
#  [
#    [ Float,          Float         ],
#    [ Float,          1.0           ],
#    [ Float,          '1.0'         ],
#    [ 1.0,            Float,        ],
#    [ '1.0',          Float,        ],
#    [ 1.0,            1.0           ],
#    [ '1.0',          '1.0'         ],
#    [ FloatOrNull,    FloatOrNull   ],
#    [ FloatOrNull,    12.345        ],
#    [ FloatOrNull,    '12.345'      ],
#    [ FloatOrNull,    'null'        ],
#    [ 123.45,         FloatOrNull   ],
#    [ '3.45',         FloatOrNull   ],
#    [ 'null',         FloatOrNull   ],
#    [ nil,            FloatOrNull   ],
#  ].each_with_index do |a, i|
#    it "#{i+1}. #{a[0]} == #{a[1]}" do
#      expect { @ret = validate_structure(*a) }.not_to raise_error
#      expect(@ret).to be_empty, "Expected empty, got #{@ret}"
#    end
#  end
#end
#
#RSpec.describe 'validate_structure():: String - GP' do
#  [
#    [ String,         String        ],
#    [ String,         '1'           ],
#    [ '1',            String        ],
#    [ '1',            '1'           ],
#    [ StringOrNull,   StringOrNull  ],
#    [ StringOrNull,   '1'           ],
#    [ StringOrNull,   'null'        ],
#    [ '1',            StringOrNull  ],
#    [ 'null',         StringOrNull  ],
#    [ nil,            StringOrNull  ],
#  ].each_with_index do |a, i|
#    it "#{i+1}. #{a[0]} == #{a[1]}" do
#      expect { @ret = validate_structure(*a) }.not_to raise_error
#      expect(@ret).to be_empty, "Expected empty, got #{@ret}"
#    end
#  end
#end
#
#RSpec.describe 'validate_structure():: Payment - GP' do
#  [
#    [ Payment,        Payment       ],
#    [ Payment,        1             ],
#    [ Payment,        '1'           ],
#    [ Payment,        1.12          ],
#    [ Payment,        '1.12'        ],
#    [ 1,              Payment       ],
#    [ '1',            Payment       ],
#    [ 1.12,           Payment       ],
#    [ '1.12',         Payment       ],
#    [ 1.12,           1.12          ],
#    [ '1.12',         '1.12'        ],
#    [ PaymentOrNull,  1             ],
#    [ PaymentOrNull,  '1'           ],
#    [ PaymentOrNull,  1.12          ],
#    [ PaymentOrNull,  '1.12'        ],
#    [ PaymentOrNull,  'null'        ],
#    [ 1,              PaymentOrNull ],
#    [ '1',            PaymentOrNull ],
#    [ 1.12,           PaymentOrNull ],
#    [ '1.12',         PaymentOrNull ],
#    [ 'null',         PaymentOrNull ],
#    [ nil,            PaymentOrNull ],
#    [ PaymentOrNull,  PaymentOrNull ],
#  ].each_with_index do |a, i|
#    it "#{i+1}. #{a[0]} == #{a[1]}" do
#      expect { @ret = validate_structure(*a) }.not_to raise_error
#      expect(@ret).to be_empty, "Expected empty, got #{@ret}"
#    end
#  end
#end
#
#RSpec.describe 'validate_structure():: Array - GP' do
#  [
#    [Array,     Array             ],
#    [Array,     []                ],
#    [[],        Array,            ],
#    [[Integer], [1, 2]            ],
#    [[String],  ['str1', 'str2']  ],
#  ].each_with_index do |a, i|
#    it "#{i+1}. #{a[0]} == #{a[1]}" do
#      expect { @ret = validate_structure(*a) }.not_to raise_error
#      expect(@ret).to be_empty, "Expected empty, got #{@ret}"
#    end
#  end
#end
#
#RSpec.describe 'validate_structure():: Hash - GP' do
#  [
#    [Hash,                        Hash                            ],
#    [Hash,                        {}                              ],
#    [{},                          Hash                            ],
#    [{},                          {}                              ],
#    [{:a    => 'true'},           {:a          => Boolean}        ],
#    [{:a    => 1234},             {:a          => Integer}        ],
#    [{:a    => []},               {:a          => Array}          ],
#    [{:a    => []},               {:a          => []}             ],
#    [{:a    => {}},               {:a          => Hash}           ],
#    [{:a    => {}},               {:a          => {}}             ],
#    [{1234  => 99},               {Integer     => Integer}        ],
#    [{1234  => 99},               {/^\d+$/     => Integer}        ],
#    [{:key  => 12.456},           {:key        => FloatOrNull}    ],
#    [{:key  => nil},              {:key        => FloatOrNull}    ],
#    [{:key  => 123456},           {:key        => IntegerOrNull}  ],
#    [{:key  => nil},              {:key        => IntegerOrNull}  ],
#    [{1234  => 99, 1235  => 100}, {Integer     => Integer}        ],
#    [{4567  => [], 4568  => []},  {Integer     => Array}          ],
#    [{4567  => [], 4568  => []},  {Integer     => []}             ],
#    [{'1-4' => 'wtaf'},           {/^\d+-\d+$/ => String}         ],
#  ].each_with_index do |a, i|
#    it "#{i+1}. #{a[0]} == #{a[1]}" do
#      expect { @ret = validate_structure(*a) }.not_to raise_error
#      expect(@ret).to be_empty, "Expected empty, got #{@ret}"
#    end
#  end
#end
#
#RSpec.describe 'validate_structure():: Complex - GP' do
#  [
#    [[{:a   => 'true'}, {:a   => 'false'}], [{:a         => Boolean}] ],
#    [[{3456 => 99},     {3457 => 100}],     [{Integer    => Integer}] ],
#    [[{5678 => []},     {5679 => []}],      [{Integer    => []}]      ],
#  ].each_with_index do |a, i|
#    it "#{i+1}. #{a[0]} == #{a[1]}" do
#      expect { @ret = validate_structure(*a) }.not_to raise_error
#      expect(@ret).to be_empty, "Expected empty, got #{@ret}"
#    end
#  end
#end
#
#RSpec.describe 'validate_structure():: Non-empty bad structures - GP' do
#  [
#    [{:a => nil},                   {:b => nil}],
#    [[{:a => nil}],                 [{:b => nil}]],
#    [{:b => nil},                   {:a => nil}],
#    [{:a => []},                    {:a => {}}],
#    [{:a => {:b => {}}},            {:a => {:b => []}}],
#    [{:a => {:b => {}}},            {:a => {:b => {}, :c => []}}],
#    [{:a => {:b => {}, :c => []}},  {:a => {:b => {}}}],
#  ].each_with_index do |v, i|
#    it "#{i+1}. #{v[0]} == #{v[1]}" do
#      expect { @ret = validate_structure(*v) }.not_to raise_error
#      expect(@ret).not_to be_empty, 'Expected non-empty return'
#    end
#  end
#end
#
#RSpec.describe 'validate_structure():: Non-empty bad data type defs - BP' do
#  [
#    [{:a     => 'trrue'},                   {:a        => Boolean}  ],
#    [[{:a     => 'true'}, {:b => 'false'}], [{:a       => Boolean}] ],
#    [{:b     => 1234},                      {:a        => Integer}  ],
#    [{:fre   => 99},                        {Integer   => Integer}  ],
#    [{:fre   => 99},                        {/^\d+$/   => Integer}  ],
#    [{'ab'   => 99},                        {/^\d+$/   => Integer}],
#    [{:key      => FloatOrNull},    {:key   => 'fred'}],
#    [{:key      => FloatOrNull},    {:ke    => 12.456}],
#    [{:key      => IntegerOrNull},  {:key   => :fred}],
#    [{:key      => IntegerOrNull},  {:key   => 12.456}],
#    [{Integer   => Integer},        {1234   => 99,    12.1  => 100}],
#    [[{Integer  => Integer}],       [{3456  => 99},   {:fre  => 100}]],
#    [{Integer   => Array},          {4567   => {},    4568  => []}],
#    [{Integer   => []},             {4567   => {},    4568  => []}],
#    [[{Integer  => []}],            [{5678  => []},  {5679  => {}}]],
#    [{Integer   => Hash},           {4567   => {},    4568  => []}],
#    [{Integer   => {}},             {4567   => {},    4568  => []}],
#    [[{Integer  => {}}],            [{5678  => []},  {5679  => []}]],
#  ].each_with_index do |v, i|
#    it "#{i+1}. #{v[0]} != #{v[1]}" do
#      expect { @ret = validate_structure(v[1], v[0]) }.not_to raise_error
#      expect(@ret.keys).not_to be_empty, "Expected non-empty return"
#    end
#  end
#end
#
#RSpec.describe 'Actual data' do
#  it '' do
#    expect {
#      validate_structure(
#        [{:id=>2754, :title=>"up!", :bodyStyleName=>"Hatchback", :minBusinessPayment=>149, :heroTrimPrivatePayment=>148.34}, {:id=>2213, :title=>"Sharan", :bodyStyleName=>"MPV", :minBusinessPayment=>353.4, :heroTrimPrivatePayment=>489.19}, {:id=>2330, :title=>"Tiguan", :bodyStyleName=>"SUV", :minBusinessPayment=>232.49, :heroTrimPrivatePayment=>404.06}, {:id =>3217, :title=>"Tiguan Allspace", :bodyStyleName=>"SUV", :minBusinessPayment=>279.13, :heroTrimPrivatePayment=>392.52}, {:id=>3202, :title=>"T-Roc", :bodyStyleName=>"SUV", :minBusinessPayment=>219, :heroTrimPrivatePayment=>310.31}, {:id=>3348, :title=>"New Polo", :bodyStyleName=>"Hatchback", :minBusinessPayment=>169, :heroTrimPrivatePayment=>207.58}, {:id=>2019, :title=>"Touareg", :bodyStyleName=>"SUV", :minBusinessPayment=>428.86, :heroTrimPrivatePayment=>621.8}, {:id=>2687, :title=>"Beetle Cabriolet", :bodyStyleName=>"Cabriolet", :minBusinessPayment=>265.1, :heroTrimPrivatePayment=>346.79}, {:id=>2639, :title=>"Beetle", :bodyStyleName=>"Coupe", :minBusinessPayment=>229, :heroTrimPrivatePayment=>313.77}, {:id=>3153, :title=>"Arteon", :bodyStyleName=>"Saloon", :minBusinessPayment=>285.83, :heroTrimPrivatePayment=>351.13}, {:id=>2897, :title=>"Golf Estate", :bodyStyleName=>"Estate", :minBusinessPayment=>259, :heroTrimPrivatePayment=>267.36}, {:id=>3379, :title=>"New Golf SV", :bodyStyleName=>"Hatchback", :minBusinessPayment=>250.35, :heroTrimPrivatePayment=>331.17}, {:id=>2039, :title=>"Passat Estate", :bodyStyleName=>"Estate", :minBusinessPayment=>221.39, :heroTrimPrivatePayment=>312.83}, {:id=>2815, :title=>"Golf", :bodyStyleName=>"Hatchback", :minBusinessPayment=>199, :heroTrimPrivatePayment=>334.27}, {:id=>1997, :title=>"Passat", :bodyStyleName=>"Saloon", :minBusinessPayment=>215.39, :heroTrimPrivatePayment=>288.18}, {:id=>2275, :title=>"Touran", :bodyStyleName=>"MPV", :minBusinessPayment=>269, :heroTrimPrivatePayment=>410.33}, {:id=>1852, :title=>"Scirocco", :bodyStyleName=>"Coupe", :minBusinessPayment=>261.5, :heroTrimPrivatePayment=>347.49}, {:id=>1999, :title=>"Jetta", :bodyStyleName=>"Saloon", :minBusinessPayment=>304.07, :heroTrimPrivatePayment=>358.22}],
#        [{:id=>Integer, :title=>String, :bodyStyleName=>String, :minBusinessPayment=>Integer, :heroTrimPrivatePayment=>Float}]
#      )
#    }.not_to raise_error
#  end
#end
#
##### END OF FILE
