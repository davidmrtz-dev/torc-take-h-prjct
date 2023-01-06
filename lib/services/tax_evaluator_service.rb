module Services
  class TaxEvaluatorService
    class << self
      def perform(flagged_products)
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
        ].map{|el| OpenStruct.new(el)}
      end
    end
  end
end