# Bespoke gems/libraries
require 'data_validator'
include DataValidator

RSpec.describe 'validate_data():: GP' do
  [
    [ [],             []            ],
    [ Boolean,        true          ],
    [ Date,           '1970-10-01'  ],
    [ Float,          1.234         ],
    [ FloatOrNull,    'null'        ],
    [ {},             {}            ],
    [ Integer,        999           ],
    [ IntegerOrNull,  'null'        ],
    [ Payment,        1.23          ],
    [ PaymentOrNull,  'null'        ],
    [ Regexp,         /./           ],
    [ String,         'string'      ],
    [ {:a => nil},    {:a => nil}   ],
    [
      {:a => /\w{3}-\w{2}/},
      {:a => 'abc-12'}
    ],
  ].each_with_index do |(c, d), i|
    it "#{i+1}. validate_data(#{c}, #{d})" do
      expect { @ret = validate_data(d, c) }.not_to raise_error
      expect(@ret).to be_a(DataValidator::ValidationResult)
      expect(@ret.normalize).to be_empty, "Got #{@ret.normalize}"
    end
  end
end

#### END OF FILE
