module Services
  class TaxEvaluatorService
    class << self
      def perform(flagged_products)
        flagged_products.map do |product|
          computed_product = OpenStruct.new({
            quantity: product.quantity,
            description: product.description,
            final_price: 0.00,
            tax_applied: 0.00,
            tax_rounded: 0.00
          })

          computed_product.tax_applied = (product.price * 0.1) if product.applicable_tax
          computed_product.tax_applied = computed_product.tax_applied + (product.price * 0.05) if product.applicable_i_tax
          computed_product.tax_rounded = round_applied_tax(computed_product.tax_applied)
          computed_product.final_price = ((product.quantity * product.price) + computed_product.tax_rounded).round(2)
          computed_product
          # byebug
        end
      end

      private

      def round_applied_tax(tax_applied)
        # num_arr = tax_applied.to_s.split('.')

        # return tax_applied if num_arr[num_arr.length - 1].eql? '0'
        # byebug
        tax_applied.round(1)
      end
    end
  end
end

# correct
# price 47.5
# total taxes 7.15

# tax1 4.75 - 
# tax2 2.375

# 7.125
