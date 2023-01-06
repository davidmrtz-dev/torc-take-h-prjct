require 'spec_helper'

RSpec.describe TaxFlaggerService do
  let(:input) do
    [
      {
        quantity: 2,
        description: 'book at',
        price: 12.49
      },
      {
        quantity: 1,
        description: 'music CD at',
        price: 14.99
      },
      {
        quantity: 1,
        description: 'chocolate bar at',
        price: 0.85
      }
    ]
  end
  let(:output) do
    [
      {
        quantity: 2,
        description: 'book:',
        price: 12.49,
        applicable_tax: false,
        applicable_i_tax: false
      },
      {
        quantity: 1,
        description: 'music CD:',
        price: 14.99,
        applicable_tax: true,
        applicable_i_tax: false
      },
      {
        quantity: 1,
        description: 'chocolate bar:',
        price: 0.85,
        applicable_tax: false,
        applicable_i_tax: false
      }
    ]
  end

  it 'return an object with flags set' do
    expect(TaxFlaggerService.perform(input)).to eq output.map{|el| OpenStruct.new(el)}
  end
end