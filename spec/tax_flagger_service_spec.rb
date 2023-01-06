require 'spec_helper'

RSpec.describe 'basic test' do
  it 'should assert' do
    expect(TaxFlaggerService.perform.first).to eq [
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
end