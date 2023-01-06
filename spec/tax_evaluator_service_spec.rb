require 'spec_helper'

RSpec.describe TaxFlaggerService do
  let(:input) do
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
  let(:output) do
    [
      {
        quantity: 2,
        description: 'book:',
        final_price: 24.98,
        tax_applied: 0.0,
        tax_rounded: 0.0
      },
      {
        quantity: 1,
        description: 'music CD:',
        final_price: 16.49,
        tax_applied: 1.499,
        tax_rounded: 1.5,
      },
      {
        quantity: 1,
        description: 'chocolate bar:',
        final_price: 0.85,
        tax_applied: 0.0,
        tax_rounded: 0.0
      }
    ]
  end

  it 'return an object with flags set' do
    expect(TaxEvaluatorService.perform(input.map{|el| OpenStruct.new(el)}))
      .to eq output.map{|el| OpenStruct.new(el)}
  end
end