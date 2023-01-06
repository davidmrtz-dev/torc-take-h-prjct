module Services
  class TaxEvaluatorService
    class << self
      def perform(flagged_products)
        flagged_products.map do |product|
          computed_product = OpenStruct.new({
            quantity: product.quantity,
            description: product.description,
            final_price: 0.0,
            tax_applied: 0.0,
            tax_rounded: 0.0
          })

          computed_product.tax_applied = (product.price * 0.1) if product.applicable_tax
          computed_product.tax_applied = (product.price * 0.05) if product.applicable_i_tax
          computed_product.tax_rounded = computed_product.tax_applied.round(1)
          computed_product.final_price = ((product.quantity * product.price) + computed_product.tax_rounded).round(2)
          computed_product
        end
      end
    end
  end
end