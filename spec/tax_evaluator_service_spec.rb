require 'spec_helper'

RSpec.describe TaxFlaggerService do
  it 'return an object with the correct calculated taxes' do
    expect(TaxEvaluatorService.perform([OpenStruct.new({
      quantity: 1,
      description: 'music CD:',
      price: 14.99,
      applicable_tax: true,
      applicable_i_tax: false
    })])).to eq([OpenStruct.new({
      quantity: 1,
      description: 'music CD:',
      final_price: 16.49,
      tax_applied: 1.499,
      tax_rounded: 1.5,
    })])
  end

  it 'return an object with the correct calculated taxes' do
    expect(TaxEvaluatorService.perform([OpenStruct.new({
      quantity: 1,
      description: 'imported bottle of perfume:',
      price: 47.50,
      applicable_tax: true,
      applicable_i_tax: true
    })])).to eq([OpenStruct.new({
      quantity: 1,
      description: "imported bottle of perfume:",
      final_price: 54.65,
      tax_applied: 7.125,
      tax_rounded: 7.15
    })])
  end
end